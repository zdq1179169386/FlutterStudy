//用户模型
class User{
  String name;
  String password;
  String token;
  bool isLogin;
  
  //构造方法  
  User({this.name,this.password,this.token});

//json 转模型
  User.fromJson(Map<String,dynamic> json){
      name = json['name'];
      password = json['password'];
      token = json['token'];
  }
  //模型转字典
  Map<String,dynamic> toJson() {
      final Map<String,dynamic> map = new Map<String,dynamic>();
      map['name'] = this.name;
      map['password'] = this.password;
      map['token'] = this.token;
  }
  //存到数据库，必须转成map
  Map<String,dynamic> toMap(){
    return {
      'password': password,
      'name': name,
      'token': token
    };
  }

  User.fromMap(Map<String,dynamic> map) {
    password = map['password'];
    name = map['name'];
    token = map['token'];
  }

  @override
  String toString() {
    return 'User{id: $name, name: $password,age: $token}';
  }
}