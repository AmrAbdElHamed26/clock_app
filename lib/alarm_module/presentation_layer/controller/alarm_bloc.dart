import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clock_app/alarm_module/data_layer/models/alarm_data_model.dart';
import 'package:equatable/equatable.dart';

import '../../../shared/utils/enums.dart';
import '../../domain_layer/entities/alarm.dart';
import '../../domain_layer/use_cases/get_alarms_data_use_case.dart';

part 'alarm_event.dart';
part 'alarm_state.dart';

class AlarmBloc extends Bloc<AlarmEvent, AlarmState> {
  final GetAlarmsDataUseCase getAlarmsDataUseCase ;
  AlarmBloc(this.getAlarmsDataUseCase) : super(const AlarmState(addNewAlarm: false)) {
    on<GetAllAlarmsEvent>((event, emit) async{

      final result = await getAlarmsDataUseCase.execute() ;

      print('result is $result');
      emit(state.copyWith(
        allAlarms: result ,
        getAllAlarmsState: RequestState.loaded ,
      ));

    });

    on<AddNewAlarmEvent>((event, emit) async{
      emit(state.copyWith(
        addNewAlarm: true ,
      ));
    });
  }
}
