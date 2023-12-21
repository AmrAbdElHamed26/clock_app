import 'package:clock_app/alarm_module/domain_layer/entities/alarm.dart';
import 'package:clock_app/alarm_module/domain_layer/repository/base_alarm_repository.dart';

class GetAlarmsDataUseCase {
  BaseAlarmRepository baseAlarmRepository ;

  GetAlarmsDataUseCase(this.baseAlarmRepository);

  Future<List<AlarmDetails>> execute ()async{
    return await baseAlarmRepository.getAlarmsData();
  }
}