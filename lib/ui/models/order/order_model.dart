import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hookahorder_owner_app/ui/models/comment/comment_model.dart';
import 'package:hookahorder_owner_app/ui/models/user/user_model.dart';

part 'order_model.freezed.dart';

part 'order_model.g.dart';

@freezed
class OrderModel with _$OrderModel {
  const OrderModel._();

  const factory OrderModel({
    required int id,
    CommentModel? comment,
    @JsonKey(name: "order_time") String? orderTime,
    @JsonKey(name: "user_id") required UserModel user,
    @JsonKey(name: "created_at") required DateTime createdAt,
    @JsonKey(name: "orderStatus") String? orderStatus,
  }) = _OrderModel;

  int get getId => id;

  CommentModel? get getComment => comment;

  String? get getOrderTime => orderTime;

  String? get getOrderStatus => orderStatus;

  UserModel get getUser => user;

  DateTime get getCreateDate => createdAt;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}
