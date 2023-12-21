import 'package:clock_app/alarm_module/presentation_layer/components/alarms_list_view.dart';
import 'package:clock_app/alarm_module/presentation_layer/controller/alarm_bloc.dart';
import 'package:clock_app/shared/services/services_locator.dart';
import 'package:clock_app/shared/utils/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clock_app/shared/utils/custom_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AlarmScreen extends StatelessWidget {
  const AlarmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => getIt<AlarmBloc>()..add(GetAllAlarmsEvent()),
      child:Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: screenHeight * .04,
                horizontal: screenWidth * .04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Alarm",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * .07),
                ),
                SizedBox(
                  height: screenHeight * .01,
                ),
                const AlarmsListView(),
              ],
            ),
          )),
    );
  }
}
