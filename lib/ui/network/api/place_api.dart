import 'package:chopper/chopper.dart';
import 'package:hookahorder_owner_app/ui/models/place/place_model.dart';

part 'place_api.chopper.dart';

@ChopperApi(baseUrl: "/place")
abstract class PlaceApi extends ChopperService{
  static PlaceApi create([ChopperClient? client]) => _$PlaceApi(client);

  @Get(path: "/get/assigned")
  Future<Response<List<PlaceModel>>> getMyPlaces();
}