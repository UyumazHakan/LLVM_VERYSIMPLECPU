int foo(int x) {
	x++;
	if(x< 6)
		foo(x);
	else 
		return x;
	return 0;
}
int main(){
	foo(3);
	return 0;
}