import 'package:flutter/material.dart';
import 'Dog.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SQLitePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SQLitePage();
  }
}

class _SQLitePage extends State {

  static int _index =0;

  

 Future<Database> createDB() async {
    var dbPdth = await getDatabasesPath();
    String path = join(dbPdth, 'myapp.db');
    Database db = await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)');
    });
    return db;
  }
  @override
  void initState() {
    super.initState();
    deleteTable('dogs');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sqlite')),
      body: Container(
          child: Center(
        child: Column(children: [
          RaisedButton(
            child:
                Text('增', style: TextStyle(fontSize: 17, color: Colors.white)),
            color: Colors.blueAccent,
            onPressed: () {
              _add();
            },
          ),
          RaisedButton(
            child:
                Text('删', style: TextStyle(fontSize: 17, color: Colors.white)),
            color: Colors.blueAccent,
            onPressed: () {
              _delete();
            },
          ),
          RaisedButton(
            child:
                Text('改', style: TextStyle(fontSize: 17, color: Colors.white)),
            color: Colors.blueAccent,
            onPressed: () {
              _edit();
            },
          ),
          RaisedButton(
            child:
                Text('查', style: TextStyle(fontSize: 17, color: Colors.white)),
            color: Colors.blueAccent,
            onPressed: () {
              _read();
            },
          ),
        ]),
      )),
    );
  }

  _add() {
    _index ++;
    Dog dog = Dog(id: _index,name: 'dog'+'$_index',age: _index+1);
    insertDog(dog);
  }

  _edit() async {
    Dog dog = Dog(id: _index,name: 'new dog',age: _index);
    updateDog(dog);
  }
  _delete() async{
    deleteDog(_index);
    _index -- ;
  }

  _read() async {
    List<Dog> _list = await dogs();
    for (var dog in _list) {
      print(dog);
    }
  }
  ///插入
  insertDog(Dog dog) async {
    final Database db = await createDB();
    await db.insert('dogs', dog.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  ///查询
  Future<List<Dog>> dogs() async {
    final Database db = await createDB();
    List<Map<String, dynamic>> maps = await db.query('dogs');
    return List.generate(maps.length, (i) {
        return Dog(
          id: maps[i]['id'],
          name: maps[i]['name'],
          age: maps[i]['age']
        );
    });
  }

///更新
 updateDog(Dog dog) async{
       final Database db = await createDB();
       await db.update('dogs', dog.toMap(),where:'id = ?',whereArgs: [dog.id]);
 }

///删除
deleteDog(int id) async {
  final Database db = await createDB();
  await db.delete('dogs',where: 'id = ?',whereArgs: [id]);
}
///删除表
deleteTable(String table) async{
    final Database db = await createDB();
    db.delete(table);
}
}
