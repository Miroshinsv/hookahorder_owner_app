part of 'login_screen_cubit.dart';

@immutable
abstract class LoginScreenState {
  final bool isRequestSend;

  const LoginScreenState({required bool this.isRequestSend});
}

class LoginScreenInitial extends LoginScreenState {
  const LoginScreenInitial({required bool isRequestSend})
      : super(isRequestSend: isRequestSend);
}

class LoginScreenSendRequestState extends LoginScreenState {
  const LoginScreenSendRequestState({required bool isRequestSend})
      : super(isRequestSend: isRequestSend);
}

class LoginScreenErrorRequestState extends LoginScreenState {
  final String errorText;

  const LoginScreenErrorRequestState(
      {required bool isRequestSend, required this.errorText})
      : super(isRequestSend: isRequestSend);
}
