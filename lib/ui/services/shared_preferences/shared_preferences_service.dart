import 'package:hookahorder_owner_app/ui/services/shared_preferences/shared_preferences_interface.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: ISharedPreferences)
class SharedPreferenceService implements ISharedPreferences {
  late SharedPreferences _preferences;
  static const String _ACCESS_TOKEN_KEY = "access_token";
  static const String _REFRESH_TOKEN_KEY = "refresh_token";
  static const String _LAST_ACTIVE_SCREEN = "last_active_string";

  @override
  Future<void> initPrefs() async {
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

  @override
  void saveAccessToken(String accessToken) {
    _preferences.setString(_ACCESS_TOKEN_KEY, accessToken);
  }

  @override
  void saveRefreshToken(String refreshToken) {
    _preferences.setString(_REFRESH_TOKEN_KEY, refreshToken);
  }

  @override
  String? getLastActivePlaceID() {
    return _preferences.getString(_LAST_ACTIVE_SCREEN);
  }

  @override
  void saveLastActivePlaceID(String lastPlaceId) {
    _preferences.setString(_LAST_ACTIVE_SCREEN, lastPlaceId);
  }

  @override
  void logOut() {
    _preferences.remove(_ACCESS_TOKEN_KEY);
    _preferences.remove(_REFRESH_TOKEN_KEY);
    _preferences.remove(_LAST_ACTIVE_SCREEN);
  }
}
