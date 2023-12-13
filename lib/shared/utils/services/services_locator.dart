import 'package:clock_app/clock_module/presentation_layer/controller/clock_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class ServiceLocator{
  void init(){
    getIt.registerFactory(() => ClockBloc());
  }
}