/*int main(){
  int a = 2;
  a = a - 2;
  if(a){
    a= a-1;
  }
  return 0;
}*/
int fact(int a){
int res = 1000;
  if(a){
    res = fact(a-1)*a;
}
  return res;
}

int main(){
  int a = fact(4);
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