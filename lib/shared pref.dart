import 'package:shared_preferences/shared_preferences.dart';

class Save{
  static SharedPreferences? sharedPrefrences;
  static init()async{
    sharedPrefrences= await SharedPreferences.getInstance();
  }

  static dynamic getdata({required String key}){
    return sharedPrefrences!.get(key);
  }
  static Future savedata({
    required String key,
    required dynamic value,
  })async {
    return await sharedPrefrences!.setStringList(key, value);
  }
}