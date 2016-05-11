; ModuleID = 'tests/sources/if_check_gt2.cpp'
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.11.0"

; Function Attrs: nounwind ssp uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 5, i32* %x, align 4
  store i32 5, i32* %y, align 4
  store i32 6, i32* %z, align 4
  %2 = load i32, i32* %x, align 4
  %3 = load i32, i32* %y, align 4
  %4 = icmp sgt i32 %2, %3
  br i1 %4, label %5, label %9

; <label>:5                                       ; preds = %0
  %6 = load i32, i32* %x, align 4
  %7 = load i32, i32* %y, align 4
  %8 = add nsw i32 %6, %7
  store i32 %8, i32* %z, align 4
  br label %9

; <label>:9                                       ; preds = %5, %0
  %10 = load i32, i32* %1, align 4
  ret i32 %10
}

attributes #0 = { nounwind ssp uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{!"Apple LLVM version 7.3.0 (clang-703.0.31)"}
