import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hookahorder_owner_app/ui/masks/input_masks.dart';
import 'package:hookahorder_owner_app/ui/screens/login_screen/login_screen_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/img/initial_with_text.png",
                    fit: BoxFit.scaleDown,
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      isDense: true,
                      hintText: "Телефон",
                    ),
                    inputFormatters: [
                      phoneFormatter,
                    ],
                  ),
                  const SizedBox(height: 3),
                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      isDense: true,
                      hintText: "Пароль",
                    ),
                  ),
                  const SizedBox(height: 3),
                  BlocProvider(
                    create: (context) => LoginScreenCubit(),
                    child: BlocBuilder<LoginScreenCubit, LoginScreenState>(
                      builder: (context, state) {
                        var provider =
                            BlocProvider.of<LoginScreenCubit>(context);
                        return Column(
                          children: [
                            state is LoginScreenErrorRequestState
                                ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Visibility(
                                      visible: true,
                                      child: Text(
                                        state.errorText,
                                        style: const TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox.shrink(),
                            SizedBox(
                              width: double.infinity,
                              child: TextButton(
                                onPressed: state.isRequestSend
                                    ? null
                                    : () async {
                                        provider.sendAuthorization(
                                          phoneController.text,
                                          passwordController.text,
                                          context
                                        );
                                      },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: state is LoginScreenSendRequestState
                                      ? const SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        )
                                      : const Text(
                                          "Вход",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
