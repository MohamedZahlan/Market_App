import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper
{
  static SharedPreferences shared = SharedPreferences as SharedPreferences;

  static init()async
  {
    shared = await SharedPreferences.getInstance();
  }

  static Future<bool> setBoolean({
  required String key,
  required bool value,
})async{
    return await shared.setBool(key, value);
  }

  static bool? getBoolean({
    required String key
  }){
   return shared.getBool(key);
  }

  static Future<bool> saveData({
  required String key,
  required value,
})async
  {
    if(value is String) return await shared.setString(key, value);
    if(value is int) return await shared.setInt(key, value);
    if(value is bool) return await shared.setBool(key, value);

    return await shared.setDouble(key, value);
  }

  static dynamic getData({
  required String key,
})
  {
    return shared.get(key);
  }

  static Future<bool> removeData({
    required String key,
})async{
    return await shared.remove(key);
  }
}
