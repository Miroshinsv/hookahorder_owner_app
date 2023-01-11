import 'package:bloc/bloc.dart';
import 'package:hookahorder_owner_app/ui/models/place/place_model.dart';
import 'package:meta/meta.dart';

part 'main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit() : super(MainScreenInitial());

  Future<void> loadMyPlaces() async{
    emit(MainScreenLoadingState());
  }
}
