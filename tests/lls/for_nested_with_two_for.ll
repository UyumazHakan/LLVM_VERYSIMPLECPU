; ModuleID = 'tests/sources/for_nested_with_two_for.cpp'
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.11.0"

; Function Attrs: nounwind ssp uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %j1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 0, i32* %x, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %26, %0
  %3 = load i32, i32* %i, align 4
  %4 = icmp slt i32 %3, 5
  br i1 %4, label %5, label %29

; <label>:5                                       ; preds = %2
  store i32 0, i32* %j, align 4
  br label %6

; <label>:6                                       ; preds = %12, %5
  %7 = load i32, i32* %j, align 4
  %8 = icmp slt i32 %7, 5
  br i1 %8, label %9, label %15

; <label>:9                                       ; preds = %6
  %10 = load i32, i32* %x, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* %x, align 4
  br label %12

; <label>:12                                      ; preds = %9
  %13 = load i32, i32* %j, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %j, align 4
  br label %6

; <label>:15                                      ; preds = %6
  store i32 0, i32* %j1, align 4
  br label %16

; <label>:16                                      ; preds = %22, %15
  %17 = load i32, i32* %j1, align 4
  %18 = icmp slt i32 %17, 5
  br i1 %18, label %19, label %25

; <label>:19                                      ; preds = %16
  %20 = load i32, i32* %x, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %x, align 4
  br label %22

; <label>:22                                      ; preds = %19
  %23 = load i32, i32* %j1, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, i32* %j1, align 4
  br label %16

; <label>:25                                      ; preds = %16
  br label %26

; <label>:26                                      ; preds = %25
  %27 = load i32, i32* %i, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, i32* %i, align 4
  br label %2

; <label>:29                                      ; preds = %2
  %30 = load i32, i32* %1, align 4
  ret i32 %30
}

attributes #0 = { nounwind ssp uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{!"Apple LLVM version 7.3.0 (clang-703.0.31)"}
