void foo(int x) {
	x++;
	if(x< 6)
		foo(x);
}
int main(){
	foo(3);
}