	.text
	.macosx_version_min 10, 11
	.file	"tests/lls/for_simple.ll"
	.globl	main
	.p2align	2
	.type	main,@function
main:                                   ! @main
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
3:	ADDi 16383 -4
4:	CPIi 16383 16319
5:	mov	 2, 16343
6:	\
7:	CPI 16383 16349
8:	ADDi 16383 -8
9:	CPIi 16383 16343
10:	BZJi .LBB0_1 0
11:	mov	 1, 16343
.LBB0_2:                                !   in Loop: Header=BB0_1 Depth=1
12:	\
13:	CPI 16383 16349
14:	ADDi 16383 -8
15:	CP 16343 16383
16:	CPI 16343 16343 CP 16343 16343 ADDi 16343 1
17:	\
18:	CPI 16383 16349
19:	ADDi 16383 -8
20:	CPIi 16383 16343
21:	\
22:	CPI 16383 16349
23:	ADDi 16383 -12
24:	CP 16343 16383
25:	CPI 16343 16343 CP 16343 16343 ADDi 16343 1
.LBB0_1:                                ! =>This Inner Loop Header: Depth=1
26:	\
27:	CPI 16383 16349
28:	ADDi 16383 -12
29:	CPIi 16383 16343
30:	\
31:	CPI 16383 16349
32:	ADDi 16383 -12
33:	CP 16343 16383
34:	CP 16317 16343 CPI 16317 16317 CPi 16318 4 LT 16318 16317 LTi 16317 4
35:	ble	 .LBB0_2
36:	nop
! BB#3:
37:	\
38:	CPI 16383 16349
39:	ADDi 16383 -4
40:	CP 16343 16383
41:	ret
42:	restore
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc


	.ident	"Apple LLVM version 7.3.0 (clang-703.0.31)"
	.section	".note.GNU-stack"
