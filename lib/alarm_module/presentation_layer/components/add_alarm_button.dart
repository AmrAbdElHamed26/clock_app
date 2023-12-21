import 'package:clock_app/alarm_module/data_layer/models/alarm_data_model.dart';
import 'package:clock_app/shared/services/alarm_local_data_base.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../shared/utils/custom_colors.dart';

class AddAlarmButton extends StatelessWidget {
  const AddAlarmButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    var screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return MaterialButton(
      onPressed: () {
/*
        /// todo : add data from add alarm button
        AlarmHelper().insertAlarm(const AlarmDataModel(
          alarmName: 'sport', alarmAvailable: 'true',
          description: 'time for gym', alarmDateTime: '6:00',

        ));*/
        /// todo : send event (add new alarm) to show form to add new alarm


      },
      child: DottedBorder(
        strokeWidth: 2,
        color: CustomColors.clockOutline,
        borderType: BorderType.RRect,
        radius: const Radius.circular(24),
        dashPattern: const [5, 4],
        child: Container(
          padding: EdgeInsets.symmetric(vertical: screenHeight * .01),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xFF3D4162),

            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
          child: Center(
            child: Column(
              children: [
                Image.asset("assets/images/add_alarm.png"),
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: Text("Add Alarm", style: TextStyle(
                      color: Colors.white, fontSize: screenWidth * .04),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
