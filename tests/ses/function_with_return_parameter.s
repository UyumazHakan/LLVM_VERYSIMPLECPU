	.text
	.macosx_version_min 10, 11
	.file	"tests/lls/function_with_return_parameter.ll"
	.globl	_Z3fooi
	.p2align	2
	.type	_Z3fooi,@function
_Z3fooi:                                ! @_Z3fooi
	.cfi_startproc
! BB#0:
0:	CPI 16333 16333 CP 16333 16333 savei 16333 -104
.Ltmp0:
	.cfi_def_cfa_register 16349
.Ltmp1:
	.cfi_window_save
.Ltmp2:
	.cfi_register 15, 31
1:	\
2:	CPI 16383 16349
3:	ADDi 16383 -8
4:	CPIi 16383 16343
5:	CPI 16343 16343 CP 16343 16343 ADDi 16343 1
6:	CP 16317 16343 CPI 16317 16317 CPi 16318 5 LT 16318 16317 LTi 16317 5
7:	bg	 .LBB0_3
8:	\
9:	CPI 16383 16349
10:	ADDi 16383 -8
11:	CPIi 16383 16343
! BB#1:
12:	call _Z3fooi
13:	\
14:	CPI 16383 16349
15:	ADDi 16383 -8
16:	CP 16327 16383
17:	BZJi .LBB0_2 0
18:	\
19:	CPI 16383 16349
20:	ADDi 16383 -4
21:	CPIi 16383 16319
.LBB0_3:
22:	\
23:	CPI 16383 16349
24:	ADDi 16383 -8
25:	CP 16343 16383
26:	\
27:	CPI 16383 16349
28:	ADDi 16383 -4
29:	CPIi 16383 16343
.LBB0_2:
30:	\
31:	CPI 16383 16349
32:	ADDi 16383 -4
33:	CP 16343 16383
34:	ret
35:	restore
.Lfunc_end0:
	.size	_Z3fooi, .Lfunc_end0-_Z3fooi
	.cfi_endproc

	.globl	main
	.p2align	2
	.type	main,@function
main:                                   ! @main
	.cfi_startproc
! BB#0:
36:	CPI 16333 16333 CP 16333 16333 savei 16333 -96
.Ltmp3:
	.cfi_def_cfa_register 16349
.Ltmp4:
	.cfi_window_save
.Ltmp5:
	.cfi_register 15, 31
37:	\
38:	CPI 16383 16349
39:	ADDi 16383 -4
40:	CPIi 16383 16319
41:	call _Z3fooi
42:	mov	 3, 16327
43:	ret
44:	CPI 16319 16319 CP 16327 16319 restorei 16327 0
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc


	.ident	"Apple LLVM version 7.3.0 (clang-703.0.31)"
	.section	".note.GNU-stack"
