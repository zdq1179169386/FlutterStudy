void main(){

  printStr('zdq');
  printStr('zdq',age: 10,gender: '22');

  printStr2('zdq');
  printStr2('zdq',11,'333');

  var list = ['a','b','c'];
  print(listTimes(list, times));
}
//可选参数,默认参数值
printStr(String name,{int age = 30, String gender = 'Male'}){
  print('name = ${name},age = ${age}, gender = ${gender}');
}
//第二种方式
printStr2(String name,[int age, String gender]){
  print('name = ${name},age = ${age}, gender = ${gender}');
}


List listTimes(List list, String f(String e)){
  for(var index=0; index < list.length; index ++){
    list[index] = f(list[index]);
  }
  return list;
}

String times(String e){
  return e * 3;
}