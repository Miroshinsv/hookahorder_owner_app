import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hookahorder_owner_app/ui/models/address/address_model.dart';

part 'place_model.freezed.dart';

part 'place_model.g.dart';

@freezed
class PlaceModel with _$PlaceModel {
  const PlaceModel._();

  const factory PlaceModel({
    required int id,
    @JsonKey(name: "address") required AddressModel address,
    @JsonKey(name: "logo_url") String? logoUrl,
    required String name,
  }) = _PlaceModel;

  int get getId => id;

  String get getName => name;

  AddressModel get getAddress => address;
  String? get getLogoUrl => logoUrl;

  factory PlaceModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceModelFromJson(json);
}
