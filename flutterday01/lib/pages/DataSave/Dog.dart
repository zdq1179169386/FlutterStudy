
class Dog {
   int id;
   String name;
   int age;
  //构造方法
  Dog({this.id,this.name,this.age});

//转化为map， 保存数据库
  Map<String,dynamic> toMap(){
    return {
      'id': id,
      'name': name,
      'age': age
    };
  }

  Dog.fromMap(Map<String,dynamic> map) {
    id = map['id'];
    name = map['name'];
    age = map['age'];
  }

  @override
  String toString() {
    return 'Dog{id: $id, name: $name,age: $age}';
  }
}
