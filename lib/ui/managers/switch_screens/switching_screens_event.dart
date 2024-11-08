part of 'switching_screens_bloc.dart';

@immutable
sealed class SwitchingScreensEvent {}

final class SwitchScreenEvent extends  SwitchingScreensEvent{
  final int currentIndex;
  final Widget screen;
  SwitchScreenEvent({required this.currentIndex, required this.screen});
}