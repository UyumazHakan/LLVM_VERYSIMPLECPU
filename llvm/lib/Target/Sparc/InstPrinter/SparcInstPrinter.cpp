//===-- SparcInstPrinter.cpp - Convert Sparc MCInst to assembly syntax -----==//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This class prints an Sparc MCInst to a .s file.
//
//===----------------------------------------------------------------------===//

#include "SparcInstPrinter.h"
#include "Sparc.h"
#include "llvm/MC/MCExpr.h"
#include "llvm/MC/MCInst.h"
#include "llvm/MC/MCRegisterInfo.h"
#include "llvm/MC/MCSymbol.h"
#include "llvm/Support/raw_ostream.h"
using namespace llvm;

#define DEBUG_TYPE "asm-printer"

// The generated AsmMatcher SparcGenAsmWriter uses "Sparc" as the target
// namespace. But SPARC backend uses "SP" as its namespace.
namespace llvm {
namespace Sparc {
  using namespace SP;
}
}

#define GET_INSTRUCTION_NAME
#define PRINT_ALIAS_INSTR
#include "SparcGenAsmWriter.inc"

bool SparcInstPrinter::isV9(const MCSubtargetInfo &STI) const {
  return (STI.getFeatureBits()[Sparc::FeatureV9]) != 0;
}

void SparcInstPrinter::printRegName(raw_ostream &OS, unsigned RegNo) const
{
  OS << StringRef(getRegisterName(RegNo));
}

void SparcInstPrinter::printInst(const MCInst *MI, raw_ostream &O,
                                 StringRef Annot, const MCSubtargetInfo &STI) {
  //TODO
  /*const MCOperand &MO1 = MI->getOperand (1);
  if(MO1.isExpr()){
    O << line++ << ":\t";
  }
  const MCOperand &MO2 = MI->getOperand (2);
  if(MO2.isExpr()){
    O << line++ << ":\t";
  }*/
  O << line++ << ":";
  if (!printAliasInstr(MI, STI, O) && !printSparcAliasInstr(MI, STI, O)){
    printInstruction(MI, STI, O);
  }
  printAnnotation(O, Annot);
}

bool SparcInstPrinter::printSparcAliasInstr(const MCInst *MI,
                                            const MCSubtargetInfo &STI,
                                            raw_ostream &O) {
  switch (MI->getOpcode()) {
  default: return false;
  case SP::JMPLrr:
  case SP::JMPLri: {
    if (MI->getNumOperands() != 3)
      return false;
    if (!MI->getOperand(0).isReg())
      return false;
    switch (MI->getOperand(0).getReg()) {
    default: return false;
    case SP::G0: // jmp $addr | ret | retl
      if (MI->getOperand(2).isImm() &&
          MI->getOperand(2).getImm() == 8) {
        switch(MI->getOperand(1).getReg()) {
        default: break;
        case SP::I7: O << "\tret"; return true;
        case SP::O7: O << "\tretl"; return true;
        }
      }
      O << "\tjmp "; printMemOperand(MI, 1, STI, O);
      return true;
    case SP::O7: // call $addr
      O << "\tcall "; printMemOperand(MI, 1, STI, O);
      return true;
    }
  }
  case SP::V9FCMPS:  case SP::V9FCMPD:  case SP::V9FCMPQ:
  case SP::V9FCMPES: case SP::V9FCMPED: case SP::V9FCMPEQ: {
    if (isV9(STI)
        || (MI->getNumOperands() != 3)
        || (!MI->getOperand(0).isReg())
        || (MI->getOperand(0).getReg() != SP::FCC0))
      return false;
    // if V8, skip printing %fcc0.
    switch(MI->getOpcode()) {
    default:
    case SP::V9FCMPS:  O << "\tfcmps "; break;
    case SP::V9FCMPD:  O << "\tfcmpd "; break;
    case SP::V9FCMPQ:  O << "\tfcmpq "; break;
    case SP::V9FCMPES: O << "\tfcmpes "; break;
    case SP::V9FCMPED: O << "\tfcmped "; break;
    case SP::V9FCMPEQ: O << "\tfcmpeq "; break;
    }
    printOperand(MI, 1, STI, O);
    O << ", ";
    printOperand(MI, 2, STI, O);
    return true;
  }
  }
}

void SparcInstPrinter::printOperand(const MCInst *MI, int opNum,
                                    const MCSubtargetInfo &STI,
                                    raw_ostream &O) {
  const MCOperand &MO = MI->getOperand (opNum);

  if (MO.isReg()) {
    printRegName(O, MO.getReg());
    return ;
  }

  if (MO.isImm()) {
    switch (MI->getOpcode()) {
      default:
        O << (int)MO.getImm(); 
        return;
        
      case SP::TICCri: // Fall through
      case SP::TICCrr: // Fall through
      case SP::TRAPri: // Fall through
      case SP::TRAPrr: // Fall through
      case SP::TXCCri: // Fall through
      case SP::TXCCrr: // Fall through
        // Only seven-bit values up to 127.
        O << ((int) MO.getImm() & 0x7f);  
        return;
    }
  }

  assert(MO.isExpr() && "Unknown operand kind in printOperand");
  MO.getExpr()->print(O, &MAI);
}

void SparcInstPrinter::printMemOperand(const MCInst *MI, int opNum,
                                       const MCSubtargetInfo &STI,
                                       raw_ostream &O, const char *Modifier) {
  O << "\n" << line++ << ":\tCPI 16383 ";
  printOperand(MI, opNum, STI, O);
  O << "\n";
  if ((MI->getOperand(opNum+1).isReg() &&
      MI->getOperand(opNum+1).getReg() == SP::G0) ||
      (MI->getOperand(opNum+1).isImm() &&
      MI->getOperand(opNum+1).getImm() == 0))
    return;
  
  O << line++ << ":\t";
  if (MI->getOperand(opNum+1).isReg())
    O << "ADD 16383";
  else
    O << "ADDi 16383";


  O << " ";
  printOperand(MI, opNum+1, STI, O);
  O << "\n" << line++ << ":\t";
}

void SparcInstPrinter::printCCOperand(const MCInst *MI, int opNum,
                                      const MCSubtargetInfo &STI,
                                      raw_ostream &O) {
  int CC = (int)MI->getOperand(opNum).getImm();
  switch (MI->getOpcode()) {
  default: break;
  case SP::FBCOND:
  case SP::FBCONDA:
  case SP::BPFCC:
  case SP::BPFCCA:
  case SP::BPFCCNT:
  case SP::BPFCCANT:
  case SP::MOVFCCrr:  case SP::V9MOVFCCrr:
  case SP::MOVFCCri:  case SP::V9MOVFCCri:
  case SP::FMOVS_FCC: case SP::V9FMOVS_FCC:
  case SP::FMOVD_FCC: case SP::V9FMOVD_FCC:
  case SP::FMOVQ_FCC: case SP::V9FMOVQ_FCC:
    // Make sure CC is a fp conditional flag.
    CC = (CC < 16) ? (CC + 16) : CC;
    break;
  case SP::CBCOND:
  case SP::CBCONDA:
    // Make sure CC is a cp conditional flag.
    CC = (CC < 32) ? (CC + 32) : CC;
    break;
  }
  O << "-" << CC << "-" << SPARCCondCodeToString((SPCC::CondCodes)CC);
}

bool SparcInstPrinter::printGetPCX(const MCInst *MI, unsigned opNum,
                                   const MCSubtargetInfo &STI,
                                   raw_ostream &O) {
  llvm_unreachable("FIXME: Implement SparcInstPrinter::printGetPCX.");
  return true;
}
