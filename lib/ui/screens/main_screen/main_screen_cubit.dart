import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hookahorder_owner_app/ui/models/place/place_model.dart';
import 'package:hookahorder_owner_app/ui/services/place_service/place_service_interface.dart';
import 'package:meta/meta.dart';

part 'main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit() : super(MainScreenInitial());

  final IPlaceService _placeService = GetIt.I.get();

  Future<void> loadMyPlaces() async {
    emit(MainScreenLoadingState());
    final resp = await _placeService.getMyPlaces();
    if (resp.isSuccessful) {
      emit(MainScreenLoadingComplete(places: resp.body!));
      return;
    }
    emit(MainScreenErrorState(errorText: resp.error.toString()));
  }
}
