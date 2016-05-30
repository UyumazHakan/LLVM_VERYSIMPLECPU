	.text
	.macosx_version_min 10, 11
	.file	"tests/lls/for_nested_with_extra_line.ll"
	.globl	main
	.p2align	2
	.type	main,@function
main:                                   ! @main
	.cfi_startproc
! BB#0:
0:	CPI 16333 16333 CP 16333 16333 savei 16333 -112
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
.LBB0_5:                                !   in Loop: Header=BB0_1 Depth=1
14:	\
15:	CPI 16383 16349
16:	ADDi 16383 -8
17:	CP 16343 16383
18:	CPI 16343 16343 CP 16343 16343 ADDi 16343 1
19:	\
20:	CPI 16383 16349
21:	ADDi 16383 -8
22:	CPIi 16383 16343
23:	\
24:	CPI 16383 16349
25:	ADDi 16383 -12
26:	CP 16343 16383
27:	CPI 16343 16343 CP 16343 16343 ADDi 16343 1
28:	\
29:	CPI 16383 16349
30:	ADDi 16383 -12
31:	CPIi 16383 16343
.LBB0_1:                                ! =>This Loop Header: Depth=1
                                        !     Child Loop BB0_3 Depth 2
32:	\
33:	CPI 16383 16349
34:	ADDi 16383 -12
35:	CP 16343 16383
36:	CP 16317 16343 CPI 16317 16317 CPi 16318 4 LT 16318 16317 LTi 16317 4
37:	bg	 .LBB0_6
38:	nop
! BB#2:                                 !   in Loop: Header=BB0_1 Depth=1
39:	BZJi .LBB0_3 0
40:	\
41:	CPI 16383 16349
42:	ADDi 16383 -16
43:	CPIi 16383 16319
.LBB0_4:                                !   in Loop: Header=BB0_3 Depth=2
44:	\
45:	CPI 16383 16349
46:	ADDi 16383 -8
47:	CP 16343 16383
48:	CPI 16343 16343 CP 16343 16343 ADDi 16343 1
49:	\
50:	CPI 16383 16349
51:	ADDi 16383 -8
52:	CPIi 16383 16343
53:	\
54:	CPI 16383 16349
55:	ADDi 16383 -16
56:	CP 16343 16383
57:	CPI 16343 16343 CP 16343 16343 ADDi 16343 1
58:	\
59:	CPI 16383 16349
60:	ADDi 16383 -16
61:	CPIi 16383 16343
.LBB0_3:                                !   Parent Loop BB0_1 Depth=1
                                        ! =>  This Inner Loop Header: Depth=2
62:	\
63:	CPI 16383 16349
64:	ADDi 16383 -16
65:	CP 16343 16383
66:	CP 16317 16343 CPI 16317 16317 CPi 16318 4 LT 16318 16317 LTi 16317 4
67:	ble	 .LBB0_4
68:	nop
69:	BZJi .LBB0_5 0
70:	nop
.LBB0_6:
71:	\
72:	CPI 16383 16349
73:	ADDi 16383 -4
74:	CP 16343 16383
75:	ret
76:	restore
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc


	.ident	"Apple LLVM version 7.3.0 (clang-703.0.31)"
	.section	".note.GNU-stack"
