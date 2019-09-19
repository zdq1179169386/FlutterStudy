void main(){
//  map 里可以有不同类型
  var map1 = {'first':'Dart',1: true,true : '2'};
  print(map1);
  print(map1[true]);
//  不可变map
  var map2 = const {'a' : 'b'};

  var map3 = new Map();

  var list = ['a','b','c'];
//  list 转map， index 作为key
  print(list.asMap());
}