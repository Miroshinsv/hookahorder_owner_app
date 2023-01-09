import 'package:chopper/chopper.dart';
import 'package:hookahorder_owner_app/ui/models/authorization/auth_response.dart';
import 'package:hookahorder_owner_app/ui/network/api/auth_api.dart';
import 'package:hookahorder_owner_app/ui/network/api_client_interface.dart';
import 'package:hookahorder_owner_app/ui/network/converter/json_serializable_converter.dart';
import 'package:hookahorder_owner_app/ui/network/interceptors/auth_interceptor.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: IApiClient)
class ApiClient implements IApiClient {
  final _chopper = ChopperClient(
    converter: const JsonSerializableConverter(
      {
        AuthResponse: AuthResponse.fromJson,
      },
    ),
    interceptors: [
      AuthInterceptor(),
    ],
    baseUrl: Uri(scheme: "http", host: "hookahorder.ru"),
    services: [
      AuthApi.create(),
    ],
  );

  @override
  AuthApi getAuthApi() => _chopper.getService<AuthApi>();
}
