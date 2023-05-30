/*int main(){
  int a = 2;
  a = a - 2;
  if(a){
    a= a-1;
  }
  return 0;
}*/
int fact(int a){
int res;
  if(a){
    res = fact(a-1)*a+10000;
}
  return res;
}

int main(){
  int a = fact(5);
 return a;
}

/*
int f(int a) {
  return a + 2;
}
int main() {
  int a = f(2);
  return 0 ;
}*/