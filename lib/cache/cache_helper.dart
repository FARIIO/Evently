import "package:shared_preferences/shared_preferences.dart";
class CacheHelper {
  //create object from sharedpref
  static late SharedPreferences sharedPreferences;
  static Future<void> cacheInit() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
  //methods
  static Future<bool> setData({required dynamic key,required String value}){
   return sharedPreferences.setString(key, value);
  }
  static dynamic getData({required dynamic key}){
    return sharedPreferences.getString(key);
  }

}