import 'package:chopper/chopper.dart';
import 'package:hookahorder_owner_app/ui/models/place/place_model.dart';

abstract class IPlaceService {
  Future<Response<List<PlaceModel>>> getMyPlaces();
}
