import 'package:equatable/equatable.dart';

class AlarmDetails extends Equatable {
  final String alarmName, alarmDate, alarmTime;
  final String alarmAvailable;
  final String description , colorIndex;
  final int alarmID ;
  final String alarmState ;

  const AlarmDetails( {
    required this.alarmID,
    required this.alarmDate,
    required this.alarmTime,
    required this.alarmName,
    required this.alarmAvailable,
    required this.description,
    required this.colorIndex,
    required this.alarmState ,
  });

  @override
  List<Object?> get props => [
    alarmID,
        alarmDate,
        alarmTime,
        alarmName,
        description,
    colorIndex,
    alarmState
      ];
}
