import 'package:chopper/chopper.dart';
import 'package:hookahorder_owner_app/ui/models/order/order_model.dart';

part 'order_api.chopper.dart';

@ChopperApi(baseUrl: "/order")
abstract class OrderApi extends ChopperService {
  static OrderApi create([ChopperClient? client]) => _$OrderApi(client);

  @Get(path: "/get/all/{placeId}")
  Future<Response<List<OrderModel>>> getOrderByCurrentPlaceId(
      @Path("placeId") int placeId);
}
