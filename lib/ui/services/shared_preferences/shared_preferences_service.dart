import 'package:hookahorder_owner_app/ui/services/shared_preferences/shared_preferences_interface.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class SharedPreferenceService implements ISharedPreferences {
  late SharedPreferences _preferences;
  static const String _ACCESS_TOKEN_KEY = "access_token";
  static const String _REFRESH_TOKEN_KEY = "refresh_token";

  SharedPreferenceService() {
    _initSharedPreference();
  }

  Future<void> _initSharedPreference() async {
    _preferences = await SharedPreferences.getInstance();
  }

  @override
  String? getAccessToken() {
    return _preferences.getString(_ACCESS_TOKEN_KEY);
  }

  @override
  String? getRefreshToken() {
    return _preferences.getString(_REFRESH_TOKEN_KEY);
  }
}
