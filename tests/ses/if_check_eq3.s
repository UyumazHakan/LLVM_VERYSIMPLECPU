	.text
	.macosx_version_min 10, 11
	.file	"tests/lls/if_check_eq3.ll"
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
1:	mov	 6, 16343
2:	\
3:	CPI 16383 16349
4:	ADDi 16383 -8
5:	CPIi 16383 16343
6:	mov	 5, 16344
7:	\
8:	CPI 16383 16349
9:	ADDi 16383 -12
10:	CPIi 16383 16344
11:	\
12:	CPI 16383 16349
13:	ADDi 16383 -8
14:	CP 16344 16383
15:	\
16:	CPI 16383 16349
17:	ADDi 16383 -12
18:	CP 16345 16383
19:	\
20:	CPI 16383 16349
21:	ADDi 16383 -4
22:	CPIi 16383 16319
23:	CP 16317 16344 CP 16318 16345 CPI 16317 16317 CPI 16318 16318  CP 16314 16317 LT 16317 16318 LT 16318 16314
24:	bne	 .LBB0_2
25:	\
26:	CPI 16383 16349
27:	ADDi 16383 -16
28:	CPIi 16383 16343
! BB#1:
29:	\
30:	CPI 16383 16349
31:	ADDi 16383 -8
32:	CP 16343 16383
33:	\
34:	CPI 16383 16349
35:	ADDi 16383 -12
36:	CP 16344 16383
37:	CPI 16343 16343 CPI 16344 16344 CP 16343 16343 ADD 16343 16344
38:	\
39:	CPI 16383 16349
40:	ADDi 16383 -16
41:	CPIi 16383 16343
.LBB0_2:
42:	\
43:	CPI 16383 16349
44:	ADDi 16383 -4
45:	CP 16343 16383
46:	ret
47:	restore
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc


	.ident	"Apple LLVM version 7.3.0 (clang-703.0.31)"
	.section	".note.GNU-stack"
