import 'package:equatable/equatable.dart';

import '../../../shared/utils/custom_colors.dart';
/*
*  create table ${Constances.kTableAlarm} (
          ${Constances.kColumnId} integer primary key autoincrement,
          ${Constances.kColumnTitle} text not null,
          ${Constances.kColumnDateTime} text not null,
          ${Constances.kColumnPending} integer,
          ${Constances.kColumnColorIndex} integer ,
           ${Constances.kColumnDescription} String),
* */

class AlarmDetails extends Equatable {
  //final String alarmID;
  final String alarmName, alarmDateTime;
  final String alarmAvailable;
  final String? description;

  const AlarmDetails({
    //required this.alarmID,
    required this.alarmName,
    required this.alarmDateTime,
    required this.alarmAvailable,
    required this.description,
  });

  @override
  List<Object?> get props => [
        alarmName,

        alarmAvailable,
        alarmAvailable,
        description,
      ];
}
