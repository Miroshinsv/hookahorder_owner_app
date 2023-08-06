import 'package:chopper/chopper.dart';
import 'package:collection/collection.dart';
import 'package:get_it/get_it.dart';
import 'package:hookahorder_owner_app/ui/models/order/order_model.dart';
import 'package:hookahorder_owner_app/ui/network/api/order_api.dart';
import 'package:hookahorder_owner_app/ui/network/api_client_interface.dart';
import 'package:hookahorder_owner_app/ui/services/order_service/order_service_interface.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IOrderService, order: 1)
class OrderServiceImpl implements IOrderService {
  final OrderApi _orderApi = GetIt.I.get<IApiClient>().getOrderApi();

  @override
  Future<(Map<DateTime, List<OrderModel>>?, String?)> getAllOrders(int placeId) async {
    final response =  await _orderApi.getOrderByCurrentPlaceId(placeId);
    if (response.isSuccessful){
      mergeSort(response.body!, compare: (v1,v2){
        return v2.getId.compareTo(v1.getId);
      });
      var grouped = groupBy(response.body!, (p0) => p0.getCreateDate);
      return (grouped, null);
    }
    return (null, response.error.toString());
  }

  @override
  Future<Response<OrderModel>> setOrderCancel(int orderId) async {
    return await _orderApi.setOrderCancel(orderId);
  }

  @override
  Future<Response<OrderModel>> setOrderComplete(int orderId) async {
    return await _orderApi.setOrderComplete(orderId);
  }

  @override
  Future<Response<OrderModel>> setOrderTaken(int orderId) async {
    return await _orderApi.setOrderTaken(orderId);
  }
}
