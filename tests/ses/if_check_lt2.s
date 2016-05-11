	.text
	.macosx_version_min 10, 11
	.file	"tests/lls/if_check_lt2.ll"
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
1:	mov	 5, 16343
2:	\
3:	CPI 16383 16349
4:	ADDi 16383 -8
5:	CPIi 16383 16343
6:	\
7:	CPI 16383 16349
8:	ADDi 16383 -12
9:	CPIi 16383 16343
10:	\
11:	CPI 16383 16349
12:	ADDi 16383 -8
13:	CP 16343 16383
14:	\
15:	CPI 16383 16349
16:	ADDi 16383 -12
17:	CP 16344 16383
18:	\
19:	CPI 16383 16349
20:	ADDi 16383 -4
21:	CPIi 16383 16319
22:	mov	 6, 16345
23:	CP 16317 16343 CP 16318 16344 CPI 16317 16317 CPI 16318 16318  CP 16314 16317 LT 16317 16318 LT 16318 16314
24:	bge	 .LBB0_2
25:	\
26:	CPI 16383 16349
27:	ADDi 16383 -16
28:	CPIi 16383 16345
! BB#1:
29:	\
30:	CPI 16383 16349
31:	ADDi 16383 -8
32:	CP 16343 16383
33:	\
34:	CPI 16383 16349
35:	ADDi 16383 -12
36:	CP 16344 16383
37:	CP 16343 16343 ADD 16343 16344
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
