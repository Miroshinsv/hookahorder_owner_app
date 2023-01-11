import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_response.freezed.dart';
part 'auth_response.g.dart';

@freezed
class AuthResponse with _$AuthResponse {
  const factory AuthResponse(String accessToken, String refreshToken) =
      _AuthResponse;

  factory AuthResponse.fromJson(Map<String, Object?> json) =>
      _$AuthResponseFromJson(json);

  const AuthResponse._();

  String get getAccessToken => accessToken;
  String get getRefreshToken => refreshToken;
}
