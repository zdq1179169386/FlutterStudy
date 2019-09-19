void main(){
  Person p1 ;
//  因为p1 是null，?. 在p1 不为空的不会去调后面的方法
  p1?.work();

  var p2;
  p2 = new Person();
//  p2 是dynamic 类型， as 可以转换类型
  (p2 as Person)?.work();

//  is: 判断是否是某种类型
  if (p2 is Person){
    p2.work();
  }

//  级联操作符
  var p3 = new Person();
  p3..name = 'zdq'
    ..age = 20
    ..work();
}

class Person{
  String name;
  int age;
  work(){
    print('work...');
  }
}