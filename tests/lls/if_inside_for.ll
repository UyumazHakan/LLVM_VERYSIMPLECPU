; ModuleID = 'tests/sources/if_inside_for.cpp'
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.11.0"

; Function Attrs: nounwind ssp uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 0, i32* %x, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %12, %0
  %3 = load i32, i32* %i, align 4
  %4 = icmp slt i32 %3, 5
  br i1 %4, label %5, label %15

; <label>:5                                       ; preds = %2
  %6 = load i32, i32* %i, align 4
  %7 = icmp sgt i32 %6, 3
  br i1 %7, label %8, label %11

; <label>:8                                       ; preds = %5
  %9 = load i32, i32* %x, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* %x, align 4
  br label %11

; <label>:11                                      ; preds = %8, %5
  br label %12

; <label>:12                                      ; preds = %11
  %13 = load i32, i32* %i, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %i, align 4
  br label %2

; <label>:15                                      ; preds = %2
  %16 = load i32, i32* %1, align 4
  ret i32 %16
}

attributes #0 = { nounwind ssp uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{!"Apple LLVM version 7.3.0 (clang-703.0.31)"}
