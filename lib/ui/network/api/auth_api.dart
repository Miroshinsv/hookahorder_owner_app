import 'package:chopper/chopper.dart';
import 'package:hookahorder_owner_app/ui/models/authorization/auth_request.dart';
import 'package:hookahorder_owner_app/ui/models/authorization/auth_response.dart';

part 'auth_api.chopper.dart';

@ChopperApi(baseUrl: "/auth")
abstract class AuthApi extends ChopperService {
  @Post(path: "/login")
  Future<Response<AuthResponse>> postAuthRequest(@Body() AuthRequest request);

  static AuthApi create([ChopperClient? client]) => _$AuthApi(client);
}
