	.text
	.macosx_version_min 10, 11
	.file	"tests/lls/for_with_more_than_one_line.ll"
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
5:	\
6:	CPI 16383 16349
7:	ADDi 16383 -8
8:	CPIi 16383 16319
9:	\
10:	CPI 16383 16349
11:	ADDi 16383 -12
12:	CPIi 16383 16319
13:	BZJi .LBB0_1 0
14:	mov	 1, 16343
.LBB0_2:                                !   in Loop: Header=BB0_1 Depth=1
15:	\
16:	CPI 16383 16349
17:	ADDi 16383 -8
18:	CP 16344 16383
19:	CPI 16344 16344 CP 16344 16344 ADDi 16344 1
20:	\
21:	CPI 16383 16349
22:	ADDi 16383 -8
23:	CPIi 16383 16344
24:	\
25:	CPI 16383 16349
26:	ADDi 16383 -8
27:	CPIi 16383 16343
28:	\
29:	CPI 16383 16349
30:	ADDi 16383 -12
31:	CP 16344 16383
32:	CPI 16344 16344 CP 16344 16344 ADDi 16344 1
33:	\
34:	CPI 16383 16349
35:	ADDi 16383 -12
36:	CPIi 16383 16344
.LBB0_1:                                ! =>This Inner Loop Header: Depth=1
37:	\
38:	CPI 16383 16349
39:	ADDi 16383 -12
40:	CP 16344 16383
41:	CP 16317 16344 CPI 16317 16317 CPi 16318 4 LT 16318 16317 LTi 16317 4
42:	ble	 .LBB0_2
43:	nop
! BB#3:
44:	\
45:	CPI 16383 16349
46:	ADDi 16383 -4
47:	CP 16343 16383
48:	ret
49:	restore
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc


	.ident	"Apple LLVM version 7.3.0 (clang-703.0.31)"
	.section	".note.GNU-stack"
