import 'package:hookahorder_owner_app/ui/network/api/auth_api.dart';
import 'package:hookahorder_owner_app/ui/network/api/order_api.dart';
import 'package:hookahorder_owner_app/ui/network/api/place_api.dart';
import 'package:hookahorder_owner_app/ui/network/api/user_api.dart';

abstract class IApiClient {
  AuthApi getAuthApi();
  PlaceApi getPlaceApi();
  UserApi getUserApi();
  OrderApi getOrderApi();
}
