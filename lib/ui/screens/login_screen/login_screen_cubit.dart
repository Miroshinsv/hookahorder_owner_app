import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hookahorder_owner_app/ui/models/authorization/auth_request.dart';
import 'package:hookahorder_owner_app/ui/routes/app_routes.dart';
import 'package:hookahorder_owner_app/ui/services/auth_service/auth_service_interface.dart';
import 'package:meta/meta.dart';

part 'login_screen_state.dart';

class LoginScreenCubit extends Cubit<LoginScreenState> {
  LoginScreenCubit() : super(const LoginScreenInitial(isRequestSend: false));
  IAuthService authService = GetIt.I.get();

  Future<void> sendAuthorization(
      String phone, String password, BuildContext context) async {
    emit(const LoginScreenSendRequestState(isRequestSend: true));
    var response = await authService.postAuth(AuthRequest(phone.replaceAll(RegExp(r"\D"), ""), password));
    if (response.isSuccessful) {
      Navigator.pushReplacementNamed(context, AppRoutes.MAIN_SCREEN);
      return;
    }
    emit(const LoginScreenErrorRequestState(isRequestSend: false, errorText: "Неверный телефон и\\или пароль"));
    Future.delayed(const Duration(seconds: 3)).then((value) => emit(const LoginScreenInitial(isRequestSend: false)));
  }
}
