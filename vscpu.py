#!/usr/bin/python
"""VerySimpleCPU"""
import sys
import re
#TODO: .v and rs232 output?

MEMSIZE = 16384

ADD  = 0
NAND = 1
SRL  = 2
LT   = 3
CP   = 4
CPI  = 5
BZ   = 6
MUL  = 7

OPCODELUT = [
    "ADD",
    "NAND",
    "SRL",
    "LT",
    "CP",
    "CPI",
    "BZJ",
    "MUL"
]

OPDICT = {
        "ADD"   : (0 << 29),
        "NAND"  : (1 << 29),
        "SRL"   : (2 << 29),
        "LT"    : (3 << 29),
        "CP"    : (4 << 29),
        "CPI"   : (5 << 29),
        "BZJ"   : (6 << 29),
        "MUL"   : (7 << 29),
        "ADDi"  : (0 << 29) | (1 << 28),
        "NANDi" : (1 << 29) | (1 << 28),
        "SRLi"  : (2 << 29) | (1 << 28),
        "LTi"   : (3 << 29) | (1 << 28),
        "CPi"   : (4 << 29) | (1 << 28),
        "CPIi"  : (5 << 29) | (1 << 28),
        "BZJi"  : (6 << 29) | (1 << 28),
        "MULi"  : (7 << 29) | (1 << 28)
        }

VALIDLINES = [
        "^ *[0-9]+: *[A-z]+ +[0-9]+ +[0-9]+ *$",
        "^ *[0-9]+: *[A-z]+ +0x[0-9A-Fa-f]+ +[0-9]+ *$",
        "^ *[0-9]+: *[A-z]+ +0x[0-9A-Fa-f]+ +0x[0-9A-Fa-f]+ *$",
        "^ *[0-9]+: *[A-z]+ +[0-9]+ +0x[0-9A-Fa-f]+ *$",
        "^ *[0-9]+: *[0-9]+ *$",
        "^ *[0-9]+: *0x[0-9A-Fa-f]+ *$",
        "^ *$"
        ]

VALIDARGS = [
            "^ *[0-9]+: *[0-9]+ *$",
            "^ *[0-9]+: *0x[0-9A-Fa-f]+ *$",
        ]


def readnumber(instr):
    """read 0x formatted hex or decimal"""
    val = None
    if instr.count("0x") != 0:
        val = int(instr, 16)
    else:
        val = int(instr)
    return val


class CpuState(object):
    """CPU state object"""
    def __init__(self):
        super(CpuState, self).__init__()
        self.pc_ = 0
        self.pause = False
        self.mem =  [0] * MEMSIZE
        self.modified =  [0] * MEMSIZE

    def dumpmemdecimal(self, filenameout):
        """dump decimal to file"""
        flout = open(filenameout, 'w')
        idx = 0
        for word in self.mem:
            if self.modified[idx]:
                flout.write("{0}: {1}\n".format(idx, int(word)))
            idx += 1
        flout.close()

    def dumpmemhex(self, filenameout):
        """dump hex to file"""
        flout = open(filenameout, 'w')
        idx = 0
        for word in self.mem:
            if self.modified[idx]:
                flout.write("{0}: {1}\n".format(idx, hex(word)))
            idx += 1
        flout.close()

    def readmem(self, filenamein):
        """read memin.txt into memory"""
        flin = open(filenamein, 'r')
        for line in flin:
            line = re.sub(":", "", line)
            words = line.split()
            assert len(words) == 2

            aaa = readnumber(words[0])
            bbb = readnumber(words[1])

            self.mem[aaa] = bbb
            self.modified[aaa] = 1
        flin.close()

    def checkvalidity(self, addrlist):
        """check if mem[addr] is garbage for every addr in addrlist"""
        for addr in addrlist:
            if not self.modified[addr]:
                print "Accesed garbage data at mem[{0}]".format(addr)
                self.pause = True
                self.pc_ -= 1
                return False
        return True


    def execute(self): #this needs to be restructured at some point
        """excute one step"""
        modifiedlocal =  [0] * MEMSIZE
        before = list(self.mem)


        op_ = (self.mem[self.pc_] >> 29)
        immediate = (self.mem[self.pc_] >> 28) & 0x00000001
        arg0 = (self.mem[self.pc_] >> 14) & 0x00003FFF
        arg1org = (self.mem[self.pc_]) & 0x00003FFF

        self.pc_ += 1
        self.modified[arg0] = 1
        modifiedlocal[arg0] = 1

        if not self.checkvalidity([self.pc_ - 1]):
            return


        if not immediate:
            if not self.checkvalidity([arg1org]):
                return
            arg1 = self.mem[arg1org]
            self.modified[arg1org] = 1
            modifiedlocal[arg1org] = 1
        else:
            arg1 = arg1org


        if op_ == ADD:
            if not self.checkvalidity([arg0]):
                return
            self.mem[arg0] = (self.mem[arg0] + arg1) & 0xFFFFFFFF
        elif op_ == NAND:
            if not self.checkvalidity([arg0]):
                return
            self.mem[arg0] = (~(self.mem[arg0] & arg1)) & 0xFFFFFFFF
        elif op_ == SRL:
            if not self.checkvalidity([arg0]):
                return
            if arg1 < 32:
                self.mem[arg0] = (self.mem[arg0] >> arg1) & 0xFFFFFFFF
            else:
                self.mem[arg0] = (self.mem[arg0] << (arg1 - 32)) & 0xFFFFFFFF
        elif op_ == LT:
            if not self.checkvalidity([arg0]):
                return
            self.mem[arg0] = int(self.mem[arg0] < arg1)
        elif op_ == CP:
            self.mem[arg0] = arg1
        elif op_ == BZ:
            if not self.checkvalidity([arg0]):
                return
            if not immediate:
                if not arg1:
                    if self.pc_ == self.mem[arg0] + 1:
                        self.pause = True
                    self.pc_ = self.mem[arg0]
            else:
                if self.pc_ == self.mem[arg0] + arg1 + 1:
                    self.pause = True
                self.pc_ = self.mem[arg0] + arg1
            #print "Jumped to new PC: " + str(self.pc_)
            if self.pc_ > MEMSIZE:
                print "New PC is outside memory bounds. Exiting..." + str(self.pc_)
                quit()

        elif op_ == CPI:
            if not immediate:
                if not self.checkvalidity([arg0, arg1org, self.mem[arg1org]]):
                    return

                self.mem[arg0] = self.mem[self.mem[arg1org]]
                self.modified[arg0] = 1
                self.modified[arg1org] = 1
                self.modified[self.mem[arg1org]] = 1
                modifiedlocal[arg0] = 1
                modifiedlocal[arg1org] = 1
                modifiedlocal[self.mem[arg1org]] = 1
            else:
                if not self.checkvalidity([arg0, arg1org]):
                    return
                self.mem[self.mem[arg0]] = self.mem[arg1org]
                self.modified[self.mem[arg0]] = 1
                self.modified[arg1org] = 1
                self.modified[arg0] = 1
                modifiedlocal[self.mem[arg0]] = 1
                modifiedlocal[arg1org] = 1
                modifiedlocal[arg0] = 1
        elif op_ == MUL:
            if not self.checkvalidity([arg0]):
                return
            self.mem[arg0] = (self.mem[arg0] * arg1) & 0xFFFFFFFF



def memgen(filenamein, filenameout):
    """parse code into memin format"""
    flin = open(filenamein, 'r')
    flout = open(filenameout, 'w')
    lineno = 0

    for line in flin:
        lineno += 1
        line = line.strip()
        line = re.sub("//.*", "", line)
        invalid = True
        for lin in VALIDLINES:
            if re.match(lin, line):
                invalid = False
                break

        if invalid:
            print "<"+filenamein+"> parse error at line " + str(lineno + 1)
            print '"' + line +'"'
            quit()

        #line = re.sub(":", "", line)
        words = line.split()
        if len(words) == 2:
            flout.write("{0} {1}\n".format(words[0], words[1]))
        elif len(words) == 4:
            op_ = None
            if words[1] in OPDICT:
                op_ = OPDICT[words[1]]
            else:
                print "Unkown operation '" + words[1] + "'",
                print "at line " + str(lineno + 1)
                quit()

            in1 = readnumber(words[2])
            in2 = readnumber(words[3])

            in1 = in1 & 0x3FFF
            in2 = in2 & 0x3FFF
            in1 = in1 << 14
            out = in1 | in2 | op_
            flout.write("{0} {1}\n".format(words[0], hex(out)))
        elif len(words) == 0: #empty line
            continue
        else:
            print "Parser messed up somewhere"
            quit()

    flin.close()
    flout.close()


def main():
    """main function"""

    finished = False

    cmd = None

    print "Processing:  "+sys.argv[1]

    if len(sys.argv) == 3:
        cmd = sys.argv[2]
    elif len(sys.argv) == 2:
        cmd = "x"
    else:
        print "{0} <input>".format(sys.argv[0])
        print "{0} <input> <r|q>".format(sys.argv[0])
        quit()


    mycpu = CpuState()
    memgen("tests/results/"+sys.argv[1]+".asm", "tests/ins/"+sys.argv[1]+".in")
    mycpu.readmem("tests/ins/"+sys.argv[1]+".in")

    while cmd != 'q' and cmd != 'r':
        print "\nProgram parsed successfully."
        print "Enter 'r' to run 'q' to quit"
        cmd = raw_input().strip()

    if cmd == 'q':
        while not mycpu.pause:
            mycpu.execute()
        mycpu.dumpmemdecimal("tests/douts/"+sys.argv[1]+".dout")
        mycpu.dumpmemhex("tests/houts/"+sys.argv[1]+".hout")
        quit()

    while True:
        if finished:
            break

        mycpu.execute()

        while mycpu.pause:
            print ">>>",
            mycpu.pause = False
            intext = raw_input().strip()
            if intext == "exit":
                finished = True
                break

            invalid = True
            for lin in VALIDARGS:
                if re.match(lin, intext):
                    invalid = False
                    break

            if invalid:
                print "Unexpected input"
                mycpu.pause = True
                continue

            intext = re.sub(":", "", intext)
            words = intext.split()
            assert len(words) == 2

            aaa = readnumber(words[0])
            bbb = readnumber(words[1])

            mycpu.mem[aaa] = bbb
            mycpu.modified[aaa] = 1
    mycpu.dumpmemdecimal("tests/douts/"+sys.argv[1]+".dout")
    mycpu.dumpmemhex("tests/houts/"+sys.argv[1]+".hout")

if __name__ == '__main__':
    main()
