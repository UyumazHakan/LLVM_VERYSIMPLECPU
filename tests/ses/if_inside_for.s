	.text
	.macosx_version_min 10, 11
	.file	"tests/lls/if_inside_for.ll"
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
9:	BZJi .LBB0_1 0
10:	\
11:	CPI 16383 16349
12:	ADDi 16383 -12
13:	CPIi 16383 16319
.LBB0_4:                                !   in Loop: Header=BB0_1 Depth=1
14:	\
15:	CPI 16383 16349
16:	ADDi 16383 -12
17:	CP 16343 16383
18:	CPI 16343 16343 CP 16343 16343 ADDi 16343 1
19:	\
20:	CPI 16383 16349
21:	ADDi 16383 -12
22:	CPIi 16383 16343
.LBB0_1:                                ! =>This Inner Loop Header: Depth=1
23:	\
24:	CPI 16383 16349
25:	ADDi 16383 -12
26:	CP 16343 16383
27:	CP 16317 16343 CPI 16317 16317 CPi 16318 4 LT 16318 16317 LTi 16317 4
28:	bg	 .LBB0_5
29:	nop
! BB#2:                                 !   in Loop: Header=BB0_1 Depth=1
30:	\
31:	CPI 16383 16349
32:	ADDi 16383 -12
33:	CP 16343 16383
34:	CP 16317 16343 CPI 16317 16317 CPi 16318 4 LT 16318 16317 LTi 16317 4
35:	bl	 .LBB0_4
36:	nop
! BB#3:                                 !   in Loop: Header=BB0_1 Depth=1
37:	\
38:	CPI 16383 16349
39:	ADDi 16383 -8
40:	CP 16343 16383
41:	CPI 16343 16343 CP 16343 16343 ADDi 16343 1
42:	BZJi .LBB0_4 0
43:	\
44:	CPI 16383 16349
45:	ADDi 16383 -8
46:	CPIi 16383 16343
.LBB0_5:
47:	\
48:	CPI 16383 16349
49:	ADDi 16383 -4
50:	CP 16343 16383
51:	ret
52:	restore
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc


	.ident	"Apple LLVM version 7.3.0 (clang-703.0.31)"
	.section	".note.GNU-stack"
