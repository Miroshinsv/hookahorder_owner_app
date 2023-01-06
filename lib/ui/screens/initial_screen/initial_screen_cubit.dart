import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'initial_screen_state.dart';

class InitialScreenCubit extends Cubit<InitialScreenState> {
  InitialScreenCubit() : super(InitialScreenInitial());
}
