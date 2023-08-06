part of 'order_screen_cubit.dart';

@immutable
abstract class OrderScreenState {}

class OrderScreenInitial extends OrderScreenState {}

class OrderScreenLoading extends OrderScreenState {}

class OrderScreenNewOrdersUpdate extends OrderScreenState {
  final Map<DateTime, List<OrderModel>> orders;

  OrderScreenNewOrdersUpdate({
    required this.orders,
  });
}

class OrderScreenLoaded extends OrderScreenState {
  final Map<DateTime, List<OrderModel>> orders;

  OrderScreenLoaded({
    required this.orders,
  });
}

class OrderScreenErrorState extends OrderScreenState {
  final String errorMsg;

  OrderScreenErrorState({required this.errorMsg});
}
