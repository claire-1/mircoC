; ModuleID = 'MicroC'
source_filename = "MicroC"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00"

declare i32 @printf(i8*, ...)

declare i32 @printbig(i32)

define i32 @main() {
entry:
  %foo_result = call i32 @foo(i32 37, i1 false)
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %foo_result)
  ret i32 0
}

define i32 @foo(i32 %a, i1 %b) {
entry:
  %a1 = alloca i32
  store i32 %a, i32* %a1
  %b2 = alloca i1
  store i1 %b, i1* %b2
  %c = alloca i32
  %d = alloca i1
  %a3 = load i32, i32* %a1
  store i32 %a3, i32* %c
  %c4 = load i32, i32* %c
  %tmp = add i32 %c4, 10
  ret i32 %tmp
}
