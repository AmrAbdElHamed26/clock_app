import 'package:clock_app/alarm_module/data_layer/models/alarm_data_model.dart';
import 'package:clock_app/alarm_module/presentation_layer/components/add_alarm_screen.dart';
import 'package:clock_app/alarm_module/presentation_layer/controller/alarm_bloc.dart';
import 'package:clock_app/shared/services/alarm_local_data_base.dart';
import 'package:clock_app/shared/services/services_locator.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/utils/custom_colors.dart';

class AddAlarmButton extends StatefulWidget {
  AddAlarmButton({Key? key}) : super(key: key);

  @override
  State<AddAlarmButton> createState() => _AddAlarmButtonState();
}

class _AddAlarmButtonState extends State<AddAlarmButton> {
  bool showAddAlarmButton = true ;

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


        Navigator.push(context, MaterialPageRoute(
          builder: (context) => AddAlarmFormData(),
        )).then((result) {
          setState(() {

            BlocProvider.of<AlarmBloc>(context).add(GetAllAlarmsEvent());
          });
        });

      },
      child: showAddAlarmButton == true ? DottedBorder(
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
      ):Container(),
    );
  }
}
