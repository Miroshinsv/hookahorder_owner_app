import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hookahorder_owner_app/ui/models/order/order_model.dart';
import 'package:hookahorder_owner_app/ui/services/order_service/order_service_interface.dart';
import 'package:meta/meta.dart';

part 'order_screen_state.dart';

class OrderScreenCubit extends Cubit<OrderScreenState> {
  OrderScreenCubit() : super(OrderScreenInitial());
  bool _isWatchStart = false;
  final IOrderService _service = GetIt.I.get();
  Map<DateTime, List<OrderModel>>? orders;

  @override
  Future<void> close() async {
    _isWatchStart = false;
    super.close();
  }

  void stopWatchOrders() {
    _isWatchStart = false;
  }

  Future<void> startWatchOrders(int placeId) async {
    _isWatchStart = true;
    while (_isWatchStart) {
      await Future.delayed(const Duration(seconds: 5));
      if (!_isWatchStart) return;
      final resp = await _service.getAllOrders(placeId);
      if (resp.$2 == null) {
        if (!const MapEquality().equals(orders, resp.$1)) {
          emit(
            OrderScreenNewOrdersUpdate(
              orders: resp.$1!,
            ),
          );
        }
      } else {
        emit(
          OrderScreenErrorState(
            errorMsg: resp.$2!,
          ),
        );
      }
    }
  }

  Future<void> cancelOrder(int orderId) async {
    await _service.setOrderCancel(orderId);
  }

  Future<void> takenOrder(int orderId) async {
    await _service.setOrderTaken(orderId);
  }

  Future<void> completeOrder(int orderId) async {
    await _service.setOrderComplete(orderId);
  }

  Future<void> initialLoad(int placeId) async {
    emit(OrderScreenLoading());
    final resp = await _service.getAllOrders(placeId);
    if (resp.$2 == null) {
      startWatchOrders(placeId);
      if (orders == null || const MapEquality().equals(orders, resp.$1)) {
        orders = resp.$1!;
        emit(
          OrderScreenNewOrdersUpdate(orders: orders!),
        );
      }
    } else {
      emit(
        OrderScreenErrorState(
          errorMsg: "Не удалось получить заказы\\n${resp.$2}",
        ),
      );
    }
  }
}
