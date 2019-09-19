void main(){

}
//抽象类
abstract class Person {
  void run();
}
//继承抽象类
class Student extends Person{
  @override
  void run() {
    // TODO: implement run
  }
}
//接口通常都是用抽象类实现的，实现接口
class Man implements Person {
  @override
  void run() {
    print('run');
  }
}