import 'package:clock_app/alarm_module/domain_layer/entities/alarm.dart';
import 'package:clock_app/alarm_module/presentation_layer/components/add_alarm_button.dart';
import 'package:clock_app/alarm_module/presentation_layer/components/alarm_component.dart';
import 'package:clock_app/alarm_module/presentation_layer/controller/alarm_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../shared/utils/custom_colors.dart';
import '../../../shared/utils/enums.dart';
class AlarmsListView extends StatelessWidget {
  const AlarmsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return BlocBuilder<AlarmBloc, AlarmState>(
      builder: (context, state) {
        var alarmData = state.allAlarms ;
        switch (state.getAllAlarmsState) {
          case RequestState.loading:
            return const Expanded(
              flex: 4,
              child: Center(child: CircularProgressIndicator()),
            );
          case RequestState.loaded:
            return  Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AlarmComponent(screenHeight: screenHeight, screenWidth: screenWidth, alarmData: alarmData),
                  AddAlarmButton(),
                ],
              ),
            );
          case RequestState.error:
            return const Expanded(
              flex: 4,
              child: Center(child: CircularProgressIndicator()),
            );
        }
      },
    );
  }
}


