	.text
	.macosx_version_min 10, 11
	.file	"tests/lls/for_definition_outside.ll"
	.globl	main
	.p2align	2
	.type	main,@function
main:                                   ! @main
	.cfi_startproc
! BB#0:
0:	CP 16333 16333 savei 16333 -112
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
9:	BZJi .LBB0_1 0
10:	\
11:	CPI 16383 16349
12:	ADDi 16383 -12
13:	CPIi 16383 16319
.LBB0_2:                                !   in Loop: Header=BB0_1 Depth=1
14:	\
15:	CPI 16383 16349
16:	ADDi 16383 -8
17:	CP 16343 16383
18:	CP 16343 16343 ADDi 16343 1
19:	\
20:	CPI 16383 16349
21:	ADDi 16383 -8
22:	CPIi 16383 16343
23:	\
24:	CPI 16383 16349
25:	ADDi 16383 -12
26:	CP 16343 16383
27:	CP 16343 16343 ADDi 16343 1
28:	\
29:	CPI 16383 16349
30:	ADDi 16383 -12
31:	CPIi 16383 16343
.LBB0_1:                                ! =>This Inner Loop Header: Depth=1
32:	\
33:	CPI 16383 16349
34:	ADDi 16383 -12
35:	CP 16343 16383
36:	CP 16317 16343 CPI 16317 16317 CPi 16318 4 LT 16318 16317 LTi 16317 4
37:	ble	 .LBB0_2
38:	nop
! BB#3:
39:	\
40:	CPI 16383 16349
41:	ADDi 16383 -4
42:	CP 16343 16383
43:	mov	 3, 16344
44:	\
45:	CPI 16383 16349
46:	ADDi 16383 -16
47:	CPIi 16383 16344
48:	ret
49:	restore
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc


	.ident	"Apple LLVM version 7.3.0 (clang-703.0.31)"
	.section	".note.GNU-stack"
