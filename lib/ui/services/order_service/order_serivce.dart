import 'package:chopper/src/response.dart';
import 'package:get_it/get_it.dart';
import 'package:hookahorder_owner_app/ui/models/order/order_model.dart';
import 'package:hookahorder_owner_app/ui/network/api/order_api.dart';
import 'package:hookahorder_owner_app/ui/services/order_service/order_service_interface.dart';
import 'package:injectable/injectable.dart';

import '../../network/api_client_interface.dart';

@LazySingleton(as: IOrderService, order: 1)
class OrderServiceImpl implements IOrderService {
  final OrderApi _orderApi = GetIt.I.get<IApiClient>().getOrderApi();

  @override
  Future<Response<List<OrderModel>>> getAllOrders(int placeId) {
    return _orderApi.getOrderByCurrentPlaceId(placeId);
  }


}
