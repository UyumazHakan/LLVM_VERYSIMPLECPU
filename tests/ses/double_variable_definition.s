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
6:	mov	 43, 16343
7:	\
8:	CPI 16383 16349
9:	ADDi 16383 -8
10:	CPIi 16383 16343
11:	mov	 13, 16344
12:	CPi 16383 0 CP 16343 16383
13:	\
14:	CPI 16383 16349
15:	ADDi 16383 -12
16:	CPIi 16383 16344
17:	ret
18:	restore
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc


	.ident	"Apple LLVM version 7.3.0 (clang-703.0.29)"
	.section	".note.GNU-stack"
