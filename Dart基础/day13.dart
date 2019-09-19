void main(){
  var d = new D();
  d.a();
  d.b();
  d.c();
}

class A {
  void a() {
    print('aaa');
}
}

class B {
  void b() {
    print('bbb');
  }
}

class C {
  void c() {
    print('ccc');
  }
}
//Mixins 实现多继承
class D extends A with B,C {

}