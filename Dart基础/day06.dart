void main(){
  print(getName("zdq"));
  printStr("zdq");
  print(getName2('zdq2'));

//  没有返回值的方法，默认是返回null
print(printStr("111"));
}

String getName(String name){
  return 'name = ${name}';
}
//去掉返回值类和参数类型
printStr(name){
  print(name);
}
//箭头函数相当于return， 这个方法和 getName 是完全一样的
getName2(name) => 'name = ${name}';

