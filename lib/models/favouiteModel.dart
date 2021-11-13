// ignore_for_file: file_names

class FavoritesModel {
  final int id;

  FavoritesModel({
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {'id': id};
  }

  @override
  String toString() {
    return 'FavoritesModel{id: $id}';
  }
}
