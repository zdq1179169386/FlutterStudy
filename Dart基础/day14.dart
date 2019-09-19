void main(){

  var utils1 = new Utils<int>();
  utils1.printf(123);

  var utils2 = new Utils<String>();
  utils2.printf('111');

  var u3 = new Utils2();
  u3.printf<int>(123);

  u3.printf<String>('123');
}
//类泛型
class Utils<T>{
  T element;

  void printf(T element){
    this.element = element;
  }
}

//方法泛型
class Utils2{
  void printf<T>(T element){
    print(element);
  }
}

