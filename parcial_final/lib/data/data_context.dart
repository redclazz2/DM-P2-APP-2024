import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class DataContext{
  String url = 'http://10.0.2.2:5278/';

  Future<http.Response> loginUser(context, mail, password) async {
    var response = await http.post(Uri.parse("${url}api/Users/Login"),
        body: jsonEncode({'email': mail, 'password': password}),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        });
    return response;
  }

  Future<http.Response> registerPerson(String email, String password,
      String name, String phone, String role, String deviceToken) async {
    var response = await http.post(Uri.parse("${url}api/Products/Favorite"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
          'picture': 'user_default.png',
          'name': name,
          'phone': phone,
          'role': role,
          'devicetoken': deviceToken
        }));

    return response;
  }
}
