	.text
	.macosx_version_min 10, 11
	.file	"tests/lls/for_nested_with_two_for.ll"
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
.LBB0_8:                                !   in Loop: Header=BB0_1 Depth=1
14:	\
15:	CPI 16383 16349
16:	ADDi 16383 -12
17:	CP 16343 16383
18:	CP 16343 16343 ADDi 16343 1
19:	\
20:	CPI 16383 16349
21:	ADDi 16383 -12
22:	CPIi 16383 16343
.LBB0_1:                                ! =>This Loop Header: Depth=1
                                        !     Child Loop BB0_3 Depth 2
                                        !     Child Loop BB0_6 Depth 2
23:	\
24:	CPI 16383 16349
25:	ADDi 16383 -12
26:	CP 16343 16383
27:	CP 16317 16343 CPI 16317 16317 CPi 16318 4 LT 16318 16317 LTi 16317 4
28:	bg	 .LBB0_9
29:	nop
! BB#2:                                 !   in Loop: Header=BB0_1 Depth=1
30:	BZJi .LBB0_3 0
31:	\
32:	CPI 16383 16349
33:	ADDi 16383 -16
34:	CPIi 16383 16319
.LBB0_4:                                !   in Loop: Header=BB0_3 Depth=2
35:	\
36:	CPI 16383 16349
37:	ADDi 16383 -8
38:	CP 16343 16383
39:	\
40:	CPI 16383 16349
41:	ADDi 16383 -16
42:	CP 16344 16383
43:	CP 16343 16343 ADDi 16343 1
44:	\
45:	CPI 16383 16349
46:	ADDi 16383 -8
47:	CPIi 16383 16343
48:	CP 16343 16344 ADDi 16343 1
49:	\
50:	CPI 16383 16349
51:	ADDi 16383 -16
52:	CPIi 16383 16343
.LBB0_3:                                !   Parent Loop BB0_1 Depth=1
                                        ! =>  This Inner Loop Header: Depth=2
53:	\
54:	CPI 16383 16349
55:	ADDi 16383 -16
56:	CP 16343 16383
57:	CP 16317 16343 CPI 16317 16317 CPi 16318 4 LT 16318 16317 LTi 16317 4
58:	ble	 .LBB0_4
59:	nop
! BB#5:                                 !   in Loop: Header=BB0_1 Depth=1
60:	BZJi .LBB0_6 0
61:	\
62:	CPI 16383 16349
63:	ADDi 16383 -20
64:	CPIi 16383 16319
.LBB0_7:                                !   in Loop: Header=BB0_6 Depth=2
65:	\
66:	CPI 16383 16349
67:	ADDi 16383 -8
68:	CP 16343 16383
69:	\
70:	CPI 16383 16349
71:	ADDi 16383 -20
72:	CP 16344 16383
73:	CP 16343 16343 ADDi 16343 1
74:	\
75:	CPI 16383 16349
76:	ADDi 16383 -8
77:	CPIi 16383 16343
78:	CP 16343 16344 ADDi 16343 1
79:	\
80:	CPI 16383 16349
81:	ADDi 16383 -20
82:	CPIi 16383 16343
.LBB0_6:                                !   Parent Loop BB0_1 Depth=1
                                        ! =>  This Inner Loop Header: Depth=2
83:	\
84:	CPI 16383 16349
85:	ADDi 16383 -20
86:	CP 16343 16383
87:	CP 16317 16343 CPI 16317 16317 CPi 16318 4 LT 16318 16317 LTi 16317 4
88:	ble	 .LBB0_7
89:	nop
90:	BZJi .LBB0_8 0
91:	nop
.LBB0_9:
92:	\
93:	CPI 16383 16349
94:	ADDi 16383 -4
95:	CP 16343 16383
96:	ret
97:	restore
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc


	.ident	"Apple LLVM version 7.3.0 (clang-703.0.31)"
	.section	".note.GNU-stack"
