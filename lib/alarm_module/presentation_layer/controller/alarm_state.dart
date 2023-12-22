part of 'alarm_bloc.dart';
class AlarmState extends Equatable {
  const AlarmState( {required this.addNewAlarm ,this.allAlarms = const [], this.getAllAlarmsState = RequestState.loading});

  final List<AlarmDetails> allAlarms;
  final RequestState getAllAlarmsState;
  final bool addNewAlarm ;

  AlarmState copyWith({
    List<AlarmDetails>? allAlarms,
    RequestState? getAllAlarmsState,
    bool ? addNewAlarm,
  }) {
    return AlarmState(
      allAlarms: allAlarms ?? this.allAlarms,
      getAllAlarmsState: getAllAlarmsState ?? this.getAllAlarmsState,
        addNewAlarm:addNewAlarm??this.addNewAlarm,
    );
  }

  @override
  List<Object?> get props => [allAlarms, getAllAlarmsState,addNewAlarm];
}