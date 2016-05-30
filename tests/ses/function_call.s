	.text
	.macosx_version_min 10, 11
	.file	"tests/lls/function_call.ll"
	.globl	_Z3foov
	.p2align	2
	.type	_Z3foov,@function
_Z3foov:                                ! @_Z3foov
	.cfi_startproc
! BB#0:
0:	CPI 16333 16333 CP 16333 16333 savei 16333 -96
.Ltmp0:
	.cfi_def_cfa_register 16349
.Ltmp1:
	.cfi_window_save
.Ltmp2:
	.cfi_register 15, 31
1:	mov	 3, 16343
2:	\
3:	CPI 16383 16349
4:	ADDi 16383 -4
5:	CPIi 16383 16343
6:	ret
7:	restore
.Lfunc_end0:
	.size	_Z3foov, .Lfunc_end0-_Z3foov
	.cfi_endproc

	.globl	main
	.p2align	2
	.type	main,@function
main:                                   ! @main
	.cfi_startproc
! BB#0:
8:	CPI 16333 16333 CP 16333 16333 savei 16333 -96
.Ltmp3:
	.cfi_def_cfa_register 16349
.Ltmp4:
	.cfi_window_save
.Ltmp5:
	.cfi_register 15, 31
9:	call _Z3foov
10:	nop
11:	ret
12:	CPI 16319 16319 CP 16327 16319 restorei 16327 0
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc


	.ident	"Apple LLVM version 7.3.0 (clang-703.0.31)"
	.section	".note.GNU-stack"
