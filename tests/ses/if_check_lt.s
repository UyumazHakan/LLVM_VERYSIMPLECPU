	.text
	.macosx_version_min 10, 11
	.file	"tests/lls/if_check_lt.ll"
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
24:	CP 16317 16343 LT 16317 16344 CP 16318 16344 LT 16318 16343
25:	bge	 .LBB0_2
26:	\
27:	CPI 16383 16349
28:	ADDi 16383 -16
29:	CPIi 16383 16345
! BB#1:
30:	\
31:	CPI 16383 16349
32:	ADDi 16383 -8
33:	CP 16343 16383
34:	\
35:	CPI 16383 16349
36:	ADDi 16383 -12
37:	CP 16344 16383
38:	CP 16343 16343 ADD 16343 16344
39:	\
40:	CPI 16383 16349
41:	ADDi 16383 -16
42:	CPIi 16383 16343
.LBB0_2:
43:	\
44:	CPI 16383 16349
45:	ADDi 16383 -4
46:	CP 16343 16383
47:	ret
48:	restore
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc


	.ident	"Apple LLVM version 7.3.0 (clang-703.0.29)"
	.section	".note.GNU-stack"
