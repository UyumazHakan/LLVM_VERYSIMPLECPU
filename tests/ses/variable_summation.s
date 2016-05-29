	.text
	.macosx_version_min 10, 11
	.file	"tests/lls/variable_summation.ll"
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
6:	\
7:	CPI 16383 16349
8:	ADDi 16383 -4
9:	CP 16343 16383
10:	mov	 43, 16344
11:	\
12:	CPI 16383 16349
13:	ADDi 16383 -8
14:	CPIi 16383 16344
15:	CPI 16344 16343 ADDi 16344 43
16:	CPi 16383 0 CP 16343 16383
17:	\
18:	CPI 16383 16349
19:	ADDi 16383 -12
20:	CPIi 16383 16344
21:	ret
22:	restore
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc


	.ident	"Apple LLVM version 7.3.0 (clang-703.0.31)"
	.section	".note.GNU-stack"
