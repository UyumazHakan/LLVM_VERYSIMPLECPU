	.text
	.macosx_version_min 10, 11
	.file	"tests/lls/if_nested.ll"
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
1:	mov	 4, 16343
2:	\
3:	CPI 16383 16349
4:	ADDi 16383 -8
5:	CPIi 16383 16343
6:	mov	 5, 16343
7:	\
8:	CPI 16383 16349
9:	ADDi 16383 -12
10:	CPIi 16383 16343
11:	\
12:	CPI 16383 16349
13:	ADDi 16383 -8
14:	CP 16343 16383
15:	\
16:	CPI 16383 16349
17:	ADDi 16383 -12
18:	CP 16344 16383
19:	\
20:	CPI 16383 16349
21:	ADDi 16383 -4
22:	CPIi 16383 16319
23:	mov	 6, 16345
24:	CP 16317 16343 CP 16318 16344 CPI 16317 16317 CPI 16318 16318  CP 16314 16317 LT 16317 16318 LT 16318 16314
25:	ble	 .LBB0_3
26:	\
27:	CPI 16383 16349
28:	ADDi 16383 -16
29:	CPIi 16383 16345
! BB#1:
30:	\
31:	CPI 16383 16349
32:	ADDi 16383 -16
33:	CP 16343 16383
34:	\
35:	CPI 16383 16349
36:	ADDi 16383 -12
37:	CP 16344 16383
38:	CP 16317 16343 CP 16318 16344 CPI 16317 16317 CPI 16318 16318  CP 16314 16317 LT 16317 16318 LT 16318 16314
39:	ble	 .LBB0_3
40:	nop
! BB#2:
41:	mov	 9, 16343
42:	\
43:	CPI 16383 16349
44:	ADDi 16383 -16
45:	CPIi 16383 16343
.LBB0_3:
46:	\
47:	CPI 16383 16349
48:	ADDi 16383 -4
49:	CP 16343 16383
50:	ret
51:	restore
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc


	.ident	"Apple LLVM version 7.3.0 (clang-703.0.31)"
	.section	".note.GNU-stack"
