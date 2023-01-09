import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hookahorder_owner_app/ui/routes/app_routes.dart';
import 'package:hookahorder_owner_app/ui/services/auth_service/auth_service_interface.dart';

part 'initial_screen_state.dart';

class InitialScreenCubit extends Cubit<InitialScreenState> {
  InitialScreenCubit() : super(const InitialScreenInitial("Авторизация"));
  IAuthService authService = GetIt.I.get();

  Future<void> checkUserCredentials(BuildContext context) async {
    if (await authService.checkUserCredentials()) {
      Navigator.pushReplacementNamed(context, AppRoutes.MAIN_SCREEN);
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.LOGIN_SCREEN);
    }
  }
}
