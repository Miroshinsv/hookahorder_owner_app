import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get_it/get_it.dart';
import 'package:hookahorder_owner_app/ui/models/order/order_model.dart';
import 'package:hookahorder_owner_app/ui/services/order_service/order_service_interface.dart';

// import 'package:hookahorder_owner_app/ui/services/shared_preferences/shared_preferences_interface.dart';
import 'package:meta/meta.dart';

part 'order_screen_state.dart';

class OrderScreenCubit extends Cubit<OrderScreenState> {
  OrderScreenCubit() : super(OrderScreenInitial());
  bool _isWatchStart = false;
  final IOrderService _service = GetIt.I.get();
  late List<OrderModel> orders;

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
      if (resp.isSuccessful) {
        if (orders.length < resp.body!.length) {
          HapticFeedback.vibrate();
          FlutterRingtonePlayer.playNotification();
          orders = resp.body!.reversed.toList();
          emit(OrderScreenNewOrdersUpdate(orders: orders,),);
        }
      } else {
        emit(
          OrderScreenErrorState(
            errorMsg: resp.error.toString(),
          ),
        );
      }
    }
  }

  Future<void> initialLoad(int placeId) async {
    emit(OrderScreenLoading());
    final resp = await _service.getAllOrders(placeId);
    if (resp.isSuccessful) {
      orders = resp.body!;
      startWatchOrders(placeId);
      emit(
        OrderScreenNewOrdersUpdate(orders: orders),
      );
    } else {
      emit(
        OrderScreenErrorState(
          errorMsg: resp.error.toString(),
        ),
      );
    }
  }
}
