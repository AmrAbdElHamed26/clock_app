part of 'alarm_bloc.dart';
class AlarmState extends Equatable {
  const AlarmState({this.allAlarms = const [], this.getAllAlarmsState = RequestState.loading});

  final List<AlarmDetails> allAlarms;
  final RequestState getAllAlarmsState;

  AlarmState copyWith({
    List<AlarmDetails>? allAlarms,
    RequestState? getAllAlarmsState,
  }) {
    return AlarmState(
      allAlarms: allAlarms ?? this.allAlarms,
      getAllAlarmsState: getAllAlarmsState ?? this.getAllAlarmsState,
    );
  }

  @override
  List<Object?> get props => [allAlarms, getAllAlarmsState];
}