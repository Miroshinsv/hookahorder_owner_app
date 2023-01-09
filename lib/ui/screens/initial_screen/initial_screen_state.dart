part of 'initial_screen_cubit.dart';

@immutable
abstract class InitialScreenState {
  final String text;

  const InitialScreenState(this.text);
}

class InitialScreenInitial extends InitialScreenState {
  const InitialScreenInitial(super.text);
}

class InitialScreenError extends InitialScreenState {
  const InitialScreenError(super.text);
}
