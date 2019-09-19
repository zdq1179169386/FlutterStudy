void main(){
 var s1 = new Student('Tom','male');

}

class Person{
  String name;
  Person(String name){
    print('Person ...');
  }
}

class Student extends Person{
  int age;
  final String gender;
//
//  Student(String name) : super(name) {
//    this.name = name;
//  }
//  初始化方法默认要调用父类的初始化方法
//   Student(String name) : super(name);

//  有final 属性的构造方法
  Student(String name, String gender) : gender = gender, super(name);
}