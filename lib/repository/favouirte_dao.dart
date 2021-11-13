import 'package:sample_project/services/db_service.dart';

class Datum {
  dynamic id;
  Datum({this.id});
  Datum.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}

class Favouritedao {
  Future<List<int>> result() async {
    final maps = (await DbServices.instance.query("FavouriteProductListTable"));
    List<Datum> mo =
        maps.isNotEmpty ? maps.map((e) => Datum.fromJson(e)).toList() : [];

    List<int> model = [];
    for (var item in mo) {
      model.add(item.id);
    }

    return model;
  }

  Future<int> insertitem(int id) async {
    try {
      int result = 1;

      await DbServices.instance
          .execute('insert into FavouriteProductListTable(id) values($id)');

      return result;
    } catch (e) {
      return 0;
    }
  }

  Future<int> deleteitem(int id) async {
    try {
      int result = 1;

      await DbServices.instance
          .execute('delete from  FavouriteProductListTable where id=$id');

      return result;
    } catch (e) {
      return 0;
    }
  }

  Future<int> deletetable() async {
    try {
      int result = 1;

      await DbServices.instance
          .execute('delete from  FavouriteProductListTable where id>0');

      return result;
    } catch (e) {
      return 0;
    }
  }
}
