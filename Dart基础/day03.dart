void main(){
  var list1 = [1,2,3,"hello",true];
//  List 可以存储不同类型
  print(list1);
//  不可变list
  var list2 = const [1,2,3];

  var list3 = new List();


//  循环
  list1.forEach((e) {
    print(e);
  });
//  反向查找
  print(list1.lastIndexOf("hello"));
//  正向查找
  print(list1.indexOf("hello"));
//  截取字符组
  print(list1.sublist(2));
}