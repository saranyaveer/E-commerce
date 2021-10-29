// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

// import 'dart:convert';

// List<String> categoryModelFromJson(String str) =>
//     List<String>.from(json.decode(str).map((x) => x));

// String categoryModelToJson(List<String> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x)));

// class CategoryModel {
//   String? title;

//   CategoryModel({
//     this.title,
//   });

//   factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
//         title: json['title'] as String?,
//       );

//   Map<String, dynamic> toJson() => {
//         'title': title,
//       };

//   CategoryModel copyWith({
//     String? title,
//   }) {
//     return CategoryModel(
//       title: title ?? this.title,
//     );
//   }
// }

class CategoryModel {
  late List<dynamic> category;

  CategoryModel({required this.category});

  CategoryModel.fromJson(List<dynamic> json) {
    category = json;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['category'] = category;

    return data;
  }
}
