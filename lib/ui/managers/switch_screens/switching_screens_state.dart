part of 'switching_screens_bloc.dart';

@immutable
sealed class SwitchingScreensState {}

final class SwitchingScreensInitial extends SwitchingScreensState {}

final class SwitchScreenState extends SwitchingScreensState {
  final Widget screen;
  final int currentIndex;
  SwitchScreenState({
    required this.screen,
    required this.currentIndex,
  });
}
