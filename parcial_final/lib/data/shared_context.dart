import 'package:shared_preferences/shared_preferences.dart';

class SharedDataContext{
  SharedPreferences? _prefs;

  Future<SharedPreferences> get prefs async{
    if(_prefs != null){
      return _prefs!;
    }

    _prefs = await SharedPreferences.getInstance();
    return _prefs!;
  } 
}