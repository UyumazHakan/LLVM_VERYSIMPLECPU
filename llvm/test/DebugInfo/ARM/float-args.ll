; RUN: %llc_dwarf -filetype=obj -mattr=+vfp2 -float-abi=hard < %s | llvm-dwarfdump -debug-dump=info - | FileCheck %s
; RUN: %llc_dwarf -filetype=obj -mattr=-vfp2 -float-abi=soft < %s | llvm-dwarfdump -debug-dump=info - | FileCheck %s
; REQUIRES: object-emission

; Generated by clang -O1 -g from the following C source:
; float foo(float p) {
;   return p;
; }

; When using the soft-float calling convention, we have to look through a
; bitcast to find the register which contains the argument.

; CHECK:     0x{{[0-9a-f]*}}:  DW_TAG_formal_parameter
; CHECK-NEXT:                      DW_AT_location

target datalayout = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7--none-eabi"

define float @foo(float %p) !dbg !4 {
entry:
  tail call void @llvm.dbg.value(metadata float %p, i64 0, metadata !9, metadata !15), !dbg !16
  ret float %p, !dbg !18
}

declare void @llvm.dbg.value(metadata, i64, metadata, metadata)

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.8.0", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, subprograms: !3)
!1 = !DIFile(filename: "test.c", directory: "")
!2 = !{}
!3 = !{!4}
!4 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 1, type: !5, isLocal: false, isDefinition: true, scopeLine: 1, flags: DIFlagPrototyped, isOptimized: true, variables: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !7}
!7 = !DIBasicType(name: "float", size: 32, align: 32, encoding: DW_ATE_float)
!8 = !{!9}
!9 = !DILocalVariable(name: "p", arg: 1, scope: !4, file: !1, line: 1, type: !7)
!10 = !{i32 2, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !DIExpression()
!16 = !DILocation(line: 1, column: 17, scope: !4)
!17 = !DILocation(line: 2, column: 12, scope: !4)
!18 = !DILocation(line: 2, column: 3, scope: !4)