import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:hookahorder_owner_app/ui/configuration/configure_depencies.dart';
import 'package:hookahorder_owner_app/ui/services/shared_preferences/shared_preferences_interface.dart';
import 'package:injectable/injectable.dart';

class AuthInterceptor extends RequestInterceptor {
  @injectable final ISharedPreferences iSharedPreferences = getIt<ISharedPreferences>();

  ISharedPreferences? get getShared => iSharedPreferences;

  AuthInterceptor(){
    print(">>>>");
    print(iSharedPreferences);
  }

  @override
  FutureOr<Request> onRequest(Request request) {
    // TODO: implement onRequest
    throw UnimplementedError();
  }
}
