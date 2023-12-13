import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'clock_event.dart';

part 'clock_state.dart';

class ClockBloc extends Bloc<ClockEvent, ClockState> {

  ClockBloc() :super(const ClockState()){
    on<ChangePageEvent>((event, emit) => emit(CurrentPageChangedState(event.pageNumber))
    );
  }
}
