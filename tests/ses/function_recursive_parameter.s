	.text
	.macosx_version_min 10, 11
	.file	"tests/lls/function_recursive_parameter.ll"
	.globl	_Z3fooi
	.p2align	2
	.type	_Z3fooi,@function
_Z3fooi:                                ! @_Z3fooi
	.cfi_startproc
! BB#0:
0:	CPI 16333 16333 CP 16333 16333 savei 16333 -96
.Ltmp0:
	.cfi_def_cfa_register 16349
.Ltmp1:
	.cfi_window_save
.Ltmp2:
	.cfi_register 15, 31
1:	\
2:	CPI 16383 16349
3:	ADDi 16383 -4
4:	CPIi 16383 16343
5:	CPI 16343 16343 CP 16343 16343 ADDi 16343 1
6:	CP 16317 16343 CPI 16317 16317 CPi 16318 5 LT 16318 16317 LTi 16317 5
7:	bg	 .LBB0_2
8:	\
9:	CPI 16383 16349
10:	ADDi 16383 -4
11:	CPIi 16383 16343
! BB#1:
12:	call _Z3fooi
13:	\
14:	CPI 16383 16349
15:	ADDi 16383 -4
16:	CP 16327 16383
.LBB0_2:
17:	ret
18:	restore
.Lfunc_end0:
	.size	_Z3fooi, .Lfunc_end0-_Z3fooi
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
20:	call _Z3fooi
21:	mov	 3, 16327
22:	ret
23:	CPI 16319 16319 CP 16327 16319 restorei 16327 0
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc


	.ident	"Apple LLVM version 7.3.0 (clang-703.0.31)"
	.section	".note.GNU-stack"
