import '../../data_layer/models/alarm_data_model.dart';

abstract class BaseAlarmRepository {

  Future<List<AlarmDataModel>> getAlarmsData();
}