import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import '../model/picture.dart';

class DBHelper {
  static Database? _database;
  static const String ID = 'id';
  static const String NAME = 'pictureName';
  static const String TABLE = 'picturesTable';
  static const String DB_Name = 'pictures.db';

  Future<Database?> get database async {
    if (null != _database){
      return _database;
    }
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_Name);
    var database = await openDatabase(path, version: 1, onCreate: _onCreate);

    return database;
  }

  _onCreate(Database database, int version) async {
    await database.execute('CREATE TABLE $TABLE ($ID INTEGER, $NAME TEXT)');
  }

  Future<Picture> save(Picture picture) async {
    var databaseClient = await database;
    picture.id = await databaseClient!.insert(TABLE, picture.toMap());
    return picture;
  }

  Future<List<Picture>> getPictures() async {
    var databaseClient = await database;
    List<Map> maps = await databaseClient!.query(TABLE, columns: [ID, NAME]);
    List<Picture> pictures = [];
    if(maps.isNotEmpty){
      for(int i=0; i<maps.length; i++){
        pictures.add(Picture.fromMap(Map<String, dynamic>.from(maps[i])));
      }
    }
    return pictures;
  }

  Future close() async {
    var databaseClient = await database;
    databaseClient!.close();
  }

}