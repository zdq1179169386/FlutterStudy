void main(){
//  匿名方法
  var func = (str){
    print('${str}');
  };
  func('zdq');

  var r = new Rectangle();
  r.width = 10;
  r.height = 20;
  print(r.area);

  var p = new Person('zdq', 20, 'male');

  var p1 = new Person.withName('jack', 'male');

  var p2 = new Person.withAge(20, 'gender');

}

class Rectangle{
  num width,height;
//  计算属性get方法
  num get area{
    return width * height;
  }
//  重写set方法
    set area(value){
      width = 10;
      height = 10;
    }
}

class Person{
  String name;
  int age;
//  final 不能在构造方法里面赋值，只能用语法糖的方式赋值，因为语法糖赋值是发生在构造方法之前的
  final String gender;

  Person(String name, int age, this.gender ){
    this.name = name;
    this.age = age;
  }
//多个构造方法
  Person.withName(String name, this.gender){
    this.name = name;
  }

  Person.withAge(this.age,this.gender);

//  初始化列表，因为gender  不能在方法里被赋值，所以只能在构造方法之前赋值
  Person.withMap(Map map) : gender = map['gender'] {
    this.name = map['name'];
    this.age = map['age'];
  }
}