import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'switching_screens_event.dart';
part 'switching_screens_state.dart';

class SwitchingScreensBloc
    extends Bloc<SwitchingScreensEvent, SwitchingScreensState> {
  SwitchingScreensBloc() : super(SwitchingScreensInitial()) {
    on<SwitchScreenEvent>((event, emit) {
      emit(SwitchScreenState(
          currentIndex: event.currentIndex, screen: event.screen));
    });
  }
}
