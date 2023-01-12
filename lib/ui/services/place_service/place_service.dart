import 'package:chopper/src/response.dart';
import 'package:get_it/get_it.dart';
import 'package:hookahorder_owner_app/ui/models/place/place_model.dart';
import 'package:hookahorder_owner_app/ui/network/api/place_api.dart';
import 'package:hookahorder_owner_app/ui/network/api_client_interface.dart';
import 'package:hookahorder_owner_app/ui/services/place_service/place_service_interface.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IPlaceService, order: 1)
class PlaceServiceImpl implements IPlaceService {
  final PlaceApi _authApi = GetIt.I.get<IApiClient>().getPlaceApi();

  @override
  Future<Response<List<PlaceModel>>> getMyPlaces() async {
    return _authApi.getMyPlaces();
  }
}
