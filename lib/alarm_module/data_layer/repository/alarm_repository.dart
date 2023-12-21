import 'package:clock_app/alarm_module/data_layer/data_source/alarm_local_data_source.dart';
import 'package:clock_app/alarm_module/data_layer/models/alarm_data_model.dart';
import 'package:clock_app/alarm_module/domain_layer/repository/base_alarm_repository.dart';

class AlarmRepository extends BaseAlarmRepository{

  final BaseAlarmDataLocalDataSource _baseAlarmRepository ;
  AlarmRepository(this._baseAlarmRepository);

  @override
  Future<List<AlarmDataModel>> getAlarmsData()async {
    final result = await _baseAlarmRepository.getAlarmsData() ;

    return result;

  }

}