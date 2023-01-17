import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hookahorder_owner_app/ui/models/order/order_model.dart';
import 'package:hookahorder_owner_app/ui/models/place/place_model.dart';
import 'package:hookahorder_owner_app/ui/screens/order_screen/order_screen_cubit.dart';
import 'package:intl/intl.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  Widget _orderCardWidget(OrderModel model) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("Заказ: ${model.getId}" ),
              Text("Телефон: ${model.getUser.phone}"),
              Text("Комментарий: ${model.comment ?? "Не указан"}"),
              Text("Время: ${model.getOrderTime ?? "Не указано"}"),
              Text("Дата заказа: ${DateFormat(DateFormat.YEAR_MONTH_DAY).format(model.getCreateDate.toLocal())}")
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as PlaceModel;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text(
            arguments.getName.toString(),
          ),
        ),
        body: BlocProvider(
          create: (context) => OrderScreenCubit(),
          child: SingleChildScrollView(
            child: BlocBuilder<OrderScreenCubit, OrderScreenState>(
              builder: (context, state) {
                final provider = BlocProvider.of<OrderScreenCubit>(context);
                if (state is OrderScreenInitial) {
                  provider.initialLoad(arguments.getId);
                  return const Center(
                    child: Text("Initial"),
                  );
                } else if (state is OrderScreenLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is OrderScreenNewOrdersUpdate) {
                  return state.orders.isEmpty
                      ? const Center(
                          child: Text("Заказов нет"),
                        )
                      : Column(
                          children: state.orders
                              .map((e) => _orderCardWidget(e))
                              .toList(),
                        );
                } else if (state is OrderScreenErrorState) {
                  return Center(
                    child: Text("Произошла ошибка: ${state.errorMsg}"),
                  );
                }
                return Center(
                  child: Text(
                    "Unknown state: $state",
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
