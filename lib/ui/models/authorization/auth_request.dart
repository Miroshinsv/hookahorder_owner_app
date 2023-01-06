import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_request.freezed.dart';

part 'auth_request.g.dart';

@freezed
class AuthRequest with _$AuthRequest {
  const factory AuthRequest(String phone, String password) = _AuthRequest;

  factory AuthRequest.fromJson(Map<String, Object?> json) =>
      _$AuthRequestFromJson(json);

  const AuthRequest._();

  String get getPhone => phone;

  String get getPassword => password;
}