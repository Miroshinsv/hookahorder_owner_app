import 'package:chopper/chopper.dart';
import 'package:hookahorder_owner_app/ui/models/authorization/auth_request.dart';
import 'package:hookahorder_owner_app/ui/models/authorization/auth_response.dart';

abstract class IAuthService {
  Future<Response<AuthResponse>> postAuth(@Body() AuthRequest request);

  Future<bool> checkUserCredentials();
}
