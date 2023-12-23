import 'package:clock_app/alarm_module/domain_layer/entities/alarm.dart';
import 'package:clock_app/shared/utils/constances.dart';

class AlarmDataModel extends AlarmDetails {
  const AlarmDataModel( {
    required super.alarmID,
    required super.alarmName,
    required super.alarmAvailable,
    required super.description, required super.alarmDate, required super.alarmTime, required super.colorIndex

  });

  Map<String, dynamic> toMap() {
    return {
      Constances.kColumnTitle: alarmName,
      Constances.kColumnDate: alarmDate,
      Constances.kColumnTime: alarmTime,
      Constances.kColumnPending: alarmAvailable,
      Constances.kColumnDescription: description,
      Constances.kColumnColorIndex:colorIndex,
    };
  }

  factory AlarmDataModel.fromMap(Map<String, dynamic> map) {
    return AlarmDataModel(
      alarmName: map[Constances.kColumnTitle],
      alarmAvailable: map[Constances.kColumnPending],
      description: map[Constances.kColumnDescription],
      alarmDate: map[Constances.kColumnDate],
      alarmTime: map[Constances.kColumnTime],
      alarmID : map[Constances.kColumnId], colorIndex: map[Constances.kColumnColorIndex],

    );
  }
}
