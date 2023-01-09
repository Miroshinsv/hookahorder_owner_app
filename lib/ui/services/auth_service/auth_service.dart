import 'package:chopper/chopper.dart';
import 'package:get_it/get_it.dart';
import 'package:hookahorder_owner_app/ui/models/authorization/auth_request.dart';
import 'package:hookahorder_owner_app/ui/models/authorization/auth_response.dart';
import 'package:hookahorder_owner_app/ui/network/api/auth_api.dart';
import 'package:hookahorder_owner_app/ui/network/api_client_interface.dart';
import 'package:hookahorder_owner_app/ui/services/auth_service/auth_service_interface.dart';
import 'package:hookahorder_owner_app/ui/services/shared_preferences/shared_preferences_interface.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: IAuthService, order: 1)
class AuthService implements IAuthService {
  final ISharedPreferences _preferences = GetIt.I.get();
  final AuthApi _authApi = GetIt.I.get<IApiClient>().getAuthApi();

  @override
  Future<Response<AuthResponse>> postAuth(AuthRequest request) async {
    final resp = await _authApi.postAuthRequest(request);
    if (resp.isSuccessful) {
      _preferences.saveAccessToken(resp.body!.getAccessToken);
      _preferences.saveRefreshToken(resp.body!.refreshToken);
    }
    return resp;
  }

  @override
  Future<bool> checkUserCredentials() async {
    final authToken = _preferences.getAccessToken();
    if (authToken == null) {
      return false;
    }
    return true;
  }
}
