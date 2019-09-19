void main(){
//  动态类型
  dynamic a = 10;
  a = 'sss';
  var list = new List<dynamic>();
  list.add(1);
  list.add('hello');
  list.add(true);

  int b ;
  
  b = 2> 0 ? 3 : 0;

  b ??= 10;
  print(b);
}