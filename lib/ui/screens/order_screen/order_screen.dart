import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hookahorder_owner_app/ui/models/place/place_model.dart';
import 'package:hookahorder_owner_app/ui/screens/order_screen/order_screen_cubit.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  List<Widget> _getControlButtons(
      String? status, int orderId, OrderScreenCubit provider) {
    switch (status) {
      case "NEW":
        return [
          IconButton(
            onPressed: () {
              provider.takenOrder(orderId);
            },
            icon: const Icon(Icons.check, color: Colors.green),
          ),
          IconButton(
            onPressed: () {
              provider.cancelOrder(orderId);
            },
            icon: const Icon(Icons.cancel, color: Colors.red),
          ),
        ];
      case "TAKEN":
        return [
          IconButton(
            onPressed: () {
              provider.completeOrder(orderId);
            },
            icon: const Icon(Icons.done_all, color: Colors.green),
          ),
          IconButton(
            onPressed: () {
              provider.cancelOrder(orderId);
            },
            icon: const Icon(Icons.cancel, color: Colors.red),
          ),
        ];
      default:
        return [];
    }
  }

  Column _getLeadingIcon(String? status) {
    switch (status) {
      case "NEW":
        return Column(
          children: const [
            Icon(
              Icons.new_releases,
              color: Colors.amber,
            ),
            Text("Новый")
          ],
        );
      case "TAKEN":
        return Column(
          children: const [
            Icon(
              Icons.takeout_dining,
              color: Colors.blue,
            ),
            Text("В работе")
          ],
        );
      case "COMPLETED":
        return Column(
          children: const [
            Icon(
              Icons.check,
              color: Colors.green,
            ),
            Text("Завершен")
          ],
        );
      case "CANCELLED":
        return Column(
          children: const [
            Icon(
              Icons.cancel,
              color: Colors.redAccent,
            ),
            Text("Отменен")
          ],
        );
      default:
        return Column(
          children: const [Icon(Icons.question_mark), Text("Не известно")],
        );
    }
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
                    : ListView.separated(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: state.orders.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider(
                            height: 3.0,
                            color: Colors.black,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          var currentOrder = state.orders[index];
                          return ListTile(
                            leading:
                                _getLeadingIcon(currentOrder.getOrderStatus),
                            tileColor: currentOrder.getOrderStatus == "NEW"
                                ? Colors.white12
                                : Colors.white,
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: _getControlButtons(
                                  currentOrder.getOrderStatus,
                                  currentOrder.getId,
                                  provider),
                            ),
                            title: Text("Заказ номер ${currentOrder.getId}"),
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      const TextSpan(text: "Время: \n"),
                                      TextSpan(
                                        text: currentOrder.getOrderTime,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      const TextSpan(text: "Телефон\n"),
                                      TextSpan(
                                        text: currentOrder.getUser.phone,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      const TextSpan(text: "Комментарий:\n"),
                                      TextSpan(
                                        text: currentOrder.getComment?.getText ?? "Не указан",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),

                          );
                        },
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
    );
  }
}
