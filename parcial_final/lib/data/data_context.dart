import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:parcial_final/data/shared_context.dart';
import 'package:parcial_final/models/person.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataContext {
  SharedDataContext sharedContext = SharedDataContext();

  String url = 'http://10.0.2.2:5141/';

  Future<http.Response> loginUser(deviceToken, mail, password) async {
    var response = await http.post(Uri.parse("${url}api/Person/Login"),
        body: jsonEncode({'email': mail, 'password': password, 'ldevicetoken':deviceToken}),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        });
    return response;
  }

  Future<List<Person>> getPersons() async {
    List<Person> data = [];
    SharedPreferences shared = await sharedContext.prefs;
    try {
      final http.Response respuesta =
          await http.get(Uri.parse("${url}api/Person/GetPersons"), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'bearer ${shared.getString("AuthToken")}'
      });

      List<dynamic> jsonDecoded = await json.decode(respuesta.body);

      for (var p in jsonDecoded) {
        data.add(Person(
            email: p["email"],
            password: p["password"],
            picture: "${url}Images/${p["picture"]}", 
            name: p["name"],
            phone: p["phone"],
            role: p["role"]));
      }
    } catch (e) {
      data = [];
    }
    return data;
  }

  Future<http.Response> registerPerson(String email, String password,
      String name, String phone, String role, String deviceToken) async {
    var response = await http.post(Uri.parse("${url}api/Person/CreatePerson"),
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
