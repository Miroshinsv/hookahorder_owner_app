part of 'main_screen_cubit.dart';

@immutable
abstract class MainScreenState {}

class MainScreenInitial extends MainScreenState {

}

class MainScreenLoadingState extends MainScreenState{

}

class MainScreenLoadingComplete extends MainScreenState{
  final List<PlaceModel> places;

  MainScreenLoadingComplete({required this.places});
}
