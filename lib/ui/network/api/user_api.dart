import 'package:chopper/chopper.dart';

part 'user_api.chopper.dart';

@ChopperApi(baseUrl: "/user")
abstract class UserApi extends ChopperService {
  static UserApi create([ChopperClient? client]) => _$UserApi(client);

  @Put(path: "/update/{id}")
  Future<Response<Map<String, dynamic>>> updateFCMToken(
      @Path("id") int userId, @Body() Map<String, dynamic> body);
}
