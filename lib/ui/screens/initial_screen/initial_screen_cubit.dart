import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hookahorder_owner_app/ui/routes/app_routes.dart';
import 'package:hookahorder_owner_app/ui/services/auth_service/auth_service_interface.dart';
import 'package:hookahorder_owner_app/ui/services/shared_preferences/shared_preferences_interface.dart';
import 'package:hookahorder_owner_app/ui/services/user_service/user_service_interface.dart';
import 'package:jwt_decode/jwt_decode.dart';

part 'initial_screen_state.dart';

class InitialScreenCubit extends Cubit<InitialScreenState> {
  InitialScreenCubit() : super(const InitialScreenInitial("Авторизация"));
  final IAuthService _authService = GetIt.I.get();
  final IUserService _userService = GetIt.I.get();
  final ISharedPreferences _preferences = GetIt.I.get();

  Future<void> checkUserCredentials(BuildContext context) async {
    if (await _authService.checkUserCredentials()) {
      String? token = await FirebaseMessaging.instance.getToken();
      Map<String, dynamic> payload = Jwt.parseJwt(_preferences.getAccessToken()!);
      await _userService.updateFCMToken(payload['userId'], token!);
      Navigator.pushReplacementNamed(context, AppRoutes.MAIN_SCREEN);
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.LOGIN_SCREEN);
    }
  }
}
