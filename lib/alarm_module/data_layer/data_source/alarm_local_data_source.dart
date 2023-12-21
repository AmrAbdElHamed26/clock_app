import 'package:clock_app/alarm_module/data_layer/models/alarm_data_model.dart';
import 'package:clock_app/shared/services/alarm_local_data_base.dart';

abstract class BaseAlarmDataLocalDataSource {
  Future<List<AlarmDataModel>> getAlarmsData();
}

class AlarmLocalDataSource extends BaseAlarmDataLocalDataSource {
  @override
  Future<List<AlarmDataModel>> getAlarmsData() async {
    return await AlarmHelper().getAlarms();
  }
}
