import 'package:clock_app/alarm_module/data_layer/data_source/alarm_local_data_source.dart';
import 'package:clock_app/alarm_module/data_layer/repository/alarm_repository.dart';
import 'package:clock_app/alarm_module/domain_layer/repository/base_alarm_repository.dart';
import 'package:clock_app/alarm_module/domain_layer/use_cases/get_alarms_data_use_case.dart';
import 'package:clock_app/alarm_module/presentation_layer/controller/alarm_bloc.dart';
import 'package:clock_app/clock_module/presentation_layer/controller/clock_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class ServiceLocator{
  void init(){
    ///blocs
    getIt.registerFactory(() => ClockBloc());
    getIt.registerFactory(() => AlarmBloc(getIt()));

    /// Data source
    getIt.registerLazySingleton<BaseAlarmDataLocalDataSource>(() => AlarmLocalDataSource());

    ///Repository
    getIt.registerLazySingleton<BaseAlarmRepository>(() => AlarmRepository(getIt()));

    ///useCases
    getIt.registerLazySingleton<GetAlarmsDataUseCase>(() =>GetAlarmsDataUseCase(getIt()) );
  }
}