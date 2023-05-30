int fact(int a){
  int res=1;
  if(a){
    res = fact(a-1)*a;
}

  return res;
}
int main(){
 return fact(3);
}