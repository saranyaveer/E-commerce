import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sample_project/models/login_model.dart';
import 'package:sample_project/models/user_model.dart';

class LoginProvider {
  LoginProvider({required this.client});

  late final http.Client client;

  Future<LoginModel> getLoginToken(String username, String password) async {
    try {
      const apiUrl = "https://fakestoreapi.com/auth/login";

      final response = await client.post(Uri.parse(apiUrl), body: {
        "username": username, // "johnd",
        "password": password //"83r5^_"
      });
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        var result = LoginModel.fromJson(data);

        return result;
      } else {
        throw Exception("No data");
        //   return [];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UserModel>> getUserList() async {
    try {
      const apiUrl = "https://fakestoreapi.com/users";

      final response = await client.get(Uri.parse(apiUrl));

      List data = jsonDecode(response.body);

      return data.map((e) => UserModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> getSingleUserDetail(String? id) async {
    try {
      String apiUrl = "https://fakestoreapi.com/products/" + id!;
      final response = await client.get(Uri.parse(apiUrl));

      UserModel userModel = UserModel.fromJson(json.decode(response.body));

      return userModel;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
