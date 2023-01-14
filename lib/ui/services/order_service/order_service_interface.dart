import 'package:chopper/chopper.dart';
import 'package:hookahorder_owner_app/ui/models/order/order_model.dart';

abstract class IOrderService {
  Future<Response<List<OrderModel>>> getAllOrders(int placeId);
}
