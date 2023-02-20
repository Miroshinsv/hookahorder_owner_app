import 'package:get_it/get_it.dart';
import 'package:hookahorder_owner_app/ui/network/api/user_api.dart';
import 'package:hookahorder_owner_app/ui/network/api_client_interface.dart';
import 'package:hookahorder_owner_app/ui/services/user_service/user_service_interface.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IUserService)
class UserServiceImpl implements IUserService {
  final UserApi _userApi = GetIt.I.get<IApiClient>().getUserApi();

  @override
  Future<void> updateFCMToken(int userId, String token) async {
    await _userApi.updateFCMToken(userId, {'fcm_token': token});
  }
}
