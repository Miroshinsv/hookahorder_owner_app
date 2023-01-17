import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hookahorder_owner_app/ui/configuration/configure_depencies.dart';
import 'package:hookahorder_owner_app/ui/routes/app_routes.dart';
import 'package:hookahorder_owner_app/ui/screens/initial_screen/initial_screen.dart';
import 'package:hookahorder_owner_app/ui/screens/initial_screen/initial_screen_cubit.dart';
import 'package:hookahorder_owner_app/ui/screens/login_screen/login_screen.dart';
import 'package:hookahorder_owner_app/ui/screens/main_screen/main_screen.dart';
import 'package:hookahorder_owner_app/ui/screens/order_screen/order_screen.dart';
import 'package:hookahorder_owner_app/ui/services/shared_preferences/shared_preferences_interface.dart';
import 'package:hookahorder_owner_app/ui/theme/theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  ISharedPreferences sharedPreferences = GetIt.I.get();
  await sharedPreferences.initPrefs();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      theme: lightTheme(),
      routes: {
        AppRoutes.LOGIN_SCREEN: (context) => const LoginScreen(),
        AppRoutes.MAIN_SCREEN: (context) => const MainScreen(),
        AppRoutes.ORDER_SCREEN: (context) => const OrderScreen(),
        AppRoutes.INITIAL_SCREEN: (context) => const InitialScreen(),
      },
      home: BlocProvider(
        create: (BuildContext context) => InitialScreenCubit(),
        child: const InitialScreen(),
      ),
    ),
  );
}
