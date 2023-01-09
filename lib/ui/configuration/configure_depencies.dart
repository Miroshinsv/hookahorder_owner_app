import 'package:get_it/get_it.dart';
import 'package:hookahorder_owner_app/ui/configuration/configure_depencies.config.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@injectableInit
void configureDependencies() => getIt.init();
