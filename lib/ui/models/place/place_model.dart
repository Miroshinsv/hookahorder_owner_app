import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_model.freezed.dart';
part 'place_model.g.dart';


@freezed
class PlaceModel with _$PlaceModel {
  const PlaceModel._();

  const factory PlaceModel({
    required int id,
    required String name,
  }) = _PlaceModel;

  int get getId => id;
  String get getName => name;

  factory PlaceModel.fromJson(Map<String, dynamic> json)
  => _$PlaceModelFromJson(json);
}
