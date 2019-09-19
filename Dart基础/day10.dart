void main(){
  var p = new Person();
  p('test',23);
}

class Person{
  String name;
  int age;
//  实现了call 方法，对象就可以像方法一样调用
  void call(String name,int age){
    print('name = $name,age = $age');
  }
}