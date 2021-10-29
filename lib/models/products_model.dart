import 'dart:convert';

List<ProductsModel> postFromJson(String str) => List<ProductsModel>.from(
    json.decode(str).map((x) => ProductsModel.fromJson(x)));

String productModelToJson(List<ProductsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductsModel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  // Rating? rating;

  ProductsModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    //   this.rating,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        id: json['id'] as int?,
        title: json['title'] as String?,
        price: (json['price'] as num?)?.toDouble(),
        description: json['description'] as String?,
        category: json['category'] as String?,
        image: json['image'] as String?,
        // rating: json['rating'] == null
        //     ? null
        //     : Rating.fromJson(json['rating'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'description': description,
        'category': category,
        'image': image,
        // 'rating': rating?.toJson(),
      };

  // ProductsModel copyWith({
  //   int? id,
  //   String? title,
  //   double? price,
  //   String? description,
  //   String? category,
  //   String? image,
  //   Rating? rating,
  // }) {
  //   return ProductsModel(
  //     id: id ?? this.id,
  //     title: title ?? this.title,
  //     price: price ?? this.price,
  //     description: description ?? this.description,
  //     category: category ?? this.category,
  //     image: image ?? this.image,
  //     rating: rating ?? this.rating,
  //   );
  // }
}

class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: (json['rate'] as num?)?.toDouble(),
        count: json['count'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'rate': rate,
        'count': count,
      };

  Rating copyWith({
    double? rate,
    int? count,
  }) {
    return Rating(
      rate: rate ?? this.rate,
      count: count ?? this.count,
    );
  }
}
