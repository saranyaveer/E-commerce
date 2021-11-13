// ignore_for_file: file_names

import 'package:sample_project/models/favouiteModel.dart';
import 'package:sample_project/services/db_service.dart';
import 'package:sqflite/sqflite.dart';

class FavoritesRepository {
  Future<List<int>> getFavoritesList() async {
    var result =
        await DbServices.instance.rawQuery("Select * from FavouritesTable");
    return result as Future<List<int>>;
  }

  Future<List<FavoritesModel>> getFavourites() async {
    final List<Map<String, dynamic>> maps =
        await DbServices.instance.query('FavouritesTable');
    return List.generate(
        maps.length, (index) => FavoritesModel(id: maps[index]['id']));
  }

  Future<int> insertFavoriteItems(FavoritesModel favs) async {
    var result = await DbServices.instance.insert(
      'FavouritesTable',
      favs.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return result;
  }

  Future<int> updateFavoriteItems(FavoritesModel favs) async {
    var result = await DbServices.instance.update(
        'FavouritesTable', favs.toMap(),
        where: 'id = ?', whereArgs: [favs.id]);
    return result;
  }

  Future<int> deleteFavoriteItems(FavoritesModel favs) async {
    var result = await DbServices.instance.delete(
      'FavouritesTable',
      where: 'id = ?',
      whereArgs: [favs.id],
    );
    return result;
  }
}
