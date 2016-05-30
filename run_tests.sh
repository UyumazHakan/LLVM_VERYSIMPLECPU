sources=`echo tests/sources`
lls=`echo tests/lls`
ses=`echo tests/ses`
results=`echo tests/results`
for file in `ls tests/sources`; do
	filename=`echo ${file%.*}`
    clang -S -emit-llvm ${sources}/${file} -o ${lls}/${filename}.ll
    llc ${lls}/${filename}.ll -march=sparc -o ${ses}/${filename}.s
    python cleaner.py ${ses}/${filename}.s > ${results}/${filename}.asm
    python vscpu.py ${filename} q
    python check_outs.py tests/douts/${filename}.dout
done