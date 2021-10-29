// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.status,
    this.msg,
    this.token,
  });

  String? status;
  String? msg;
  String? token;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        msg: json["msg"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "token": token,
      };
}




// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

// import 'dart:convert';

// LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

// String loginModelToJson(LoginModel data) => json.encode(data.toJson());

// class LoginModel {
//     LoginModel({
//         this.token,
//     });

//     String token;

//     factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
//         token: json["token"],
//     );

//     Map<String, dynamic> toJson() => {
//         "token": token,
//     };
// }


