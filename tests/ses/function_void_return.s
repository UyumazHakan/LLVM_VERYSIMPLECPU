	.text
	.macosx_version_min 10, 11
	.file	"tests/lls/function_void_return.ll"
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
1:	CPi 16383 0 CP 16343 16383
2:	CP 16317 16343 CPI 16317 16317 CPi 16318 6 LT 16318 16317 LTi 16317 6
3:	bl	 .LBB0_2
4:	\
5:	CPI 16383 16349
6:	ADDi 16383 -4
7:	CPIi 16383 16319
! BB#1:
8:	\
9:	CPI 16383 16349
10:	ADDi 16383 -4
11:	CP 16343 16383
12:	CPI 16343 16343 CP 16343 16343 ADDi 16343 1
13:	\
14:	CPI 16383 16349
15:	ADDi 16383 -4
16:	CPIi 16383 16343
.LBB0_2:
17:	ret
18:	restore
.Lfunc_end0:
	.size	_Z3foov, .Lfunc_end0-_Z3foov
	.cfi_endproc

	.globl	main
	.p2align	2
	.type	main,@function
main:                                   ! @main
	.cfi_startproc
! BB#0:
19:	CPI 16333 16333 CP 16333 16333 savei 16333 -96
.Ltmp3:
	.cfi_def_cfa_register 16349
.Ltmp4:
	.cfi_window_save
.Ltmp5:
	.cfi_register 15, 31
20:	call _Z3foov
21:	nop
22:	ret
23:	CPI 16319 16319 CP 16327 16319 restorei 16327 0
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc


	.ident	"Apple LLVM version 7.3.0 (clang-703.0.31)"
	.section	".note.GNU-stack"
