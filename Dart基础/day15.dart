void main(){
  var p1 = new Person(18);
  var p2 = new Person(20);
  print(p1 > p2);
}

class Person{
  int age;

  Person(this.age);
//  操作符复写
 bool operator > (Person person){
   return this.age > person.age;
 }
}
//枚举，不能指定初始值
enum Season{
  spring,
  summer,
  autumn,
  winter,
}