import 'package:clock_app/alarm_module/domain_layer/entities/alarm.dart';
import 'package:clock_app/shared/utils/constances.dart';

class AlarmDataModel extends AlarmDetails {
  const AlarmDataModel({
    required super.alarmName,
    required super.alarmAvailable,
    required super.description,
    required super.alarmDateTime,
  });

  Map<String, dynamic> toMap() {
    return {
      Constances.kColumnTitle: alarmName,
      Constances.kColumnDateTime: alarmDateTime,
      Constances.kColumnPending: alarmAvailable,
      Constances.kColumnDescription: description,
    };
  }

  factory AlarmDataModel.fromMap(Map<String, dynamic> map) {
    return AlarmDataModel(
      alarmName: map[Constances.kColumnTitle],
      alarmAvailable: map[Constances.kColumnPending],
      description: map[Constances.kColumnDescription],
      alarmDateTime: map[Constances.kColumnDateTime],
    );
  }
}
