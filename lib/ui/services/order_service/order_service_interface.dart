import 'package:chopper/chopper.dart';
import 'package:hookahorder_owner_app/ui/models/order/order_model.dart';

abstract class IOrderService {
  Future<(Map<DateTime, List<OrderModel>>?, String?)> getAllOrders(int placeId);

  Future<Response<OrderModel>> setOrderTaken(int orderId);

  Future<Response<OrderModel>> setOrderComplete(int orderId);

  Future<Response<OrderModel>> setOrderCancel(int orderId);
}
