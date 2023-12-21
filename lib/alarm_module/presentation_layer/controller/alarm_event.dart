part of 'alarm_bloc.dart';

abstract class AlarmEvent extends Equatable {
  const AlarmEvent();
}

class GetAllAlarmsEvent extends AlarmEvent {

  @override
  List<Object?> get props => [];

}


