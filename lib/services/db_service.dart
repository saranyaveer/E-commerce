import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

class DbServices {
  static late Database instance;

  static Future<void> init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, "NewsSam_db");
    instance = await openDatabase(path, version: 1, onCreate: _initDb);
    //  return instance;
  }

  static void _initDb(Database db, int newVersion) async {
    await db.execute("CREATE TABLE ProductList("
        "id INTEGER PRIMARY KEY,"
        "title TEXT ,"
        "price REAL,"
        "description TEXT,"
        "category TEXT,"
        "image TEXT"
        ")");

    await db.execute("CREATE TABLE FavouriteProductTable("
        "id INTEGER PRIMARY KEY,"
        "title TEXT ,"
        "price REAL,"
        "description TEXT,"
        "category TEXT,"
        "image TEXT"
        ")");

    await db.execute("CREATE TABLE FavouriteProductListTable("
        "ProductId INTEGER"
        ")");
    await db.execute("CREATE TABLE FavouritesTable("
        "id INTEGER"
        ")");
  }
}
