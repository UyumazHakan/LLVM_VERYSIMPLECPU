	.text
	.macosx_version_min 10, 11
	.file	"tests/lls/double_variable_definition.ll"
	.globl	main
	.p2align	2
	.type	main,@function
main:                                   ! @main
	.cfi_startproc
! BB#0:
0:	CP 16333 16333 savei 16333 -104
.Ltmp0:
	.cfi_def_cfa_register 16349
.Ltmp1:
	.cfi_window_save
.Ltmp2:
	.cfi_register 15, 31
1:	mov	 72, 16343
2:	\
3:	CPI 16383 16349
4:	ADDi 16383 -4
5:	CPIi 16383 16343
6:	mov	 43, 16344
7:	CPi 16383 0 CP 16343 16383
8:	\
9:	CPI 16383 16349
10:	ADDi 16383 -8
11:	CPIi 16383 16344
12:	ret
13:	restore
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc


	.ident	"Apple LLVM version 7.3.0 (clang-703.0.31)"
	.section	".note.GNU-stack"
