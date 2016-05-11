	.text
	.macosx_version_min 10, 11
	.file	"tests/lls/substraction.ll"
	.globl	main
	.p2align	2
	.type	main,@function
main:                                   ! @main
	.cfi_startproc
! BB#0:
0:	CP 16333 16333 savei 16333 -96
.Ltmp0:
	.cfi_def_cfa_register 16349
.Ltmp1:
	.cfi_window_save
.Ltmp2:
	.cfi_register 15, 31
1:	mov	 9, 16344
2:	CPi 16383 0 CP 16343 16383
3:	\
4:	CPI 16383 16349
5:	ADDi 16383 -4
6:	CPIi 16383 16344
7:	ret
8:	restore
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc


	.ident	"Apple LLVM version 7.3.0 (clang-703.0.31)"
	.section	".note.GNU-stack"
