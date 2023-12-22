part of 'alarm_bloc.dart';

abstract class AlarmEvent extends Equatable {
  const AlarmEvent();
}

class GetAllAlarmsEvent extends AlarmEvent {

  @override
  List<Object?> get props => [];

}

class AddNewAlarmEvent extends AlarmEvent {
  final bool currentState ;

  const AddNewAlarmEvent({required this.currentState});
  @override
  List<Object?> get props => [currentState];

}


