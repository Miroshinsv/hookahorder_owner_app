import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:get_it/get_it.dart';
import 'package:hookahorder_owner_app/ui/services/shared_preferences/shared_preferences_interface.dart';

class AuthInterceptor implements RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) {
    final ISharedPreferences sharedPreferences = GetIt.I.get();
    if (sharedPreferences.getAccessToken() != null) {
      request.headers["Authorization"] =
          "Bearer ${sharedPreferences.getAccessToken()}";
    }
    return request;
  }
}
