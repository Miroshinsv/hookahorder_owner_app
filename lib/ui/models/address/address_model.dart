import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.freezed.dart';

part 'address_model.g.dart';

@freezed
class AddressModel with _$AddressModel {
  AddressModel._();

  factory AddressModel(String address, double lat, double lng) = _AddressModel;

  factory AddressModel.fromJson(Map<String, Object?> json) =>
      _$AddressModelFromJson(json);

  String get getAddress => address;

  List<double> get getCoordinates => [lat, lng];
}
