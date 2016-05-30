; ModuleID = 'tests/sources/function_void_return.cpp'
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.11.0"

; Function Attrs: nounwind ssp uwtable
define void @_Z3foov() #0 {
  %x = alloca i32, align 4
  store i32 0, i32* %x, align 4
  %1 = load i32, i32* %x, align 4
  %2 = icmp slt i32 %1, 6
  br i1 %2, label %3, label %4

; <label>:3                                       ; preds = %0
  br label %7

; <label>:4                                       ; preds = %0
  %5 = load i32, i32* %x, align 4
  %6 = add nsw i32 %5, 1
  store i32 %6, i32* %x, align 4
  br label %7

; <label>:7                                       ; preds = %4, %3
  ret void
}

; Function Attrs: nounwind ssp uwtable
define i32 @main() #0 {
  call void @_Z3foov()
  ret i32 0
}

attributes #0 = { nounwind ssp uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{!"Apple LLVM version 7.3.0 (clang-703.0.31)"}
