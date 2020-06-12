class User {
  String name;
  String password;
  String token;
  String avatar = "https://avatars3.githubusercontent.com/u/12589520?s=400&u=b5d077236cd15b97a5fb2e2fd76a65d862d3ff72&v=4";
  bool isLogin;

  User({this.name, this.password, this.token,this.avatar});
//json 转模型
  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    password = json['password'];
    token = json['token'];
    avatar = json['avatar'];
  }
  //模型转字典
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = new Map<String, dynamic>();
    map['name'] = this.name;
    map['password'] = this.password;
    map['token'] = this.token;
    map['avatar'] = this.avatar;
  }

  //存到数据库，必须转成map
  Map<String, dynamic> toMap() {
    return {'password': password, 'name': name, 'token': token, 'avatar': avatar};
  }

  User.fromMap(Map<String, dynamic> map) {
    password = map['password'];
    name = map['name'];
    token = map['token'];
    avatar = map['avatar'];
  }

  @override
  String toString() {
    return 'User{name: $name, password: $password,token: $token, avatar: $avatar}';
  }
}
