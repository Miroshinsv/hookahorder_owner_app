import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hookahorder_owner_app/ui/models/user/user_model.dart';

part 'order_model.freezed.dart';

part 'order_model.g.dart';

@freezed
class OrderModel with _$OrderModel {
  const OrderModel._();

  const factory OrderModel({
    required int id,
    String? comment,
    @JsonKey(name: "order_time") String? orderTime,
    @JsonKey(name: "user_id") required UserModel user,
  }) = _OrderModel;

  int get getId => id;
  String? get getComment => comment;
  String? get getOrderTime => orderTime;
  UserModel get getUser => user;


  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}