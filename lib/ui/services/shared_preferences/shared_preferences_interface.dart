abstract class ISharedPreferences {
  String? getAccessToken();

  Future<void> initPrefs();

  String? getRefreshToken();

  void saveAccessToken(String accessToken);

  void saveRefreshToken(String refreshToken);
}
