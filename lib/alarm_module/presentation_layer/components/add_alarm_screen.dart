import 'package:clock_app/alarm_module/data_layer/models/alarm_data_model.dart';
import 'package:clock_app/shared/utils/constances.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:just_toast/toast/show_toast.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:time_picker_spinner/time_picker_spinner.dart';

import '../../../shared/services/alarm_local_data_base.dart';

class AddAlarmFormData extends StatefulWidget {
  const AddAlarmFormData({
    super.key,
  });

  @override
  State<AddAlarmFormData> createState() => _AddAlarmFormDataState();
}

class _AddAlarmFormDataState extends State<AddAlarmFormData> {
  bool _showCalender = false;

  late var selectedTime;

  late var selectedDate;

  late var time;

  String alarmName = "Alarm";
  String alarmDescription = "None";

  bool stateOfSnooze = true;

  @override
  void initState() {
    time = DateTime.now();
    selectedTime = DateTimeFormat.format(time, format: 'Hm');
    selectedDate = DateTimeFormat.format(time, format: 'd , M');
    print('selected time is $selectedTime');
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(children: [
        Column(
          children: [
            Expanded(
              flex: 5,
              child: GestureDetector(
                  onTap: () {
                    if (_showCalender == true) {
                      _showCalender = false;
                      setState(() {});
                    }
                  },
                  child: TimePickerSpinner(
                    locale: const Locale('en', ''),
                    is24HourMode: false,
                    isShowSeconds: false,
                    itemWidth: screenWidth * .25,
                    normalTextStyle: TextStyle(
                      color: Colors.purple.withOpacity(.3),
                      fontSize: 30,
                    ),
                    highlightedTextStyle: const TextStyle(
                        fontSize: 30,
                        color: Colors.purple,
                        fontWeight: FontWeight.bold),
                    isForce2Digits: true,
                    onTimeChange: (time) {
                      DateTime dateTime = DateTime.parse(time.toString());
                      selectedTime = DateFormat('h:mm a').format(dateTime);
                    },
                  )),
            ),
            Expanded(
              flex: 9,
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    if (!_showCalender)
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Color(0xFF262626),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GradientText(text: selectedDate),
                                IconButton(
                                  onPressed: () {
                                    _showCalender = true;
                                    setState(() {});
                                  },
                                  icon: ShaderMask(
                                    blendMode: BlendMode.srcATop,
                                    shaderCallback: (Rect bounds) {
                                      return const LinearGradient(
                                        colors: [Colors.purple, Colors.white],
                                      ).createShader(bounds);
                                    },
                                    child: const Icon(
                                      Icons.calendar_month_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: Colors.purple,
                                    width: 1.0,
                                  ),
                                ),
                                child: TextField(
                                  onChanged: (value) {
                                    alarmName = value;
                                  },
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 16.0),
                                    hintText: 'e.g., Morning Run',
                                    hintStyle: TextStyle(
                                      color: Colors.purple.shade500
                                          .withOpacity(.5),
                                    ),
                                  ),
                                  style: const TextStyle(
                                    color: Colors.purple,
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.purple.shade500.withOpacity(.3),
                            ),
                            SizedBox(
                              height: screenHeight * .01,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GradientText(text: 'Snooze'),
                                    Row(
                                      children: [
                                        Container(
                                          width: 1,
                                          height: screenHeight * .04,
                                          color: Colors.purple.withOpacity(.7),
                                        ),
                                        const SizedBox(
                                          width: 7,
                                        ),
                                        Switch(
                                          value: stateOfSnooze,
                                          onChanged: (bool value) {
                                            stateOfSnooze = value;
                                            setState(() {});
                                          },
                                          activeTrackColor: Colors.purple,
                                          inactiveTrackColor:
                                              Colors.purple.withOpacity(.5),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: screenHeight * .01,
                            ),
                            Divider(
                              color: Colors.purple.shade500.withOpacity(.3),
                            ),
                            SizedBox(
                              height: screenHeight * .01,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Container(
                                height: screenHeight * .23,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: Colors.purple,
                                    width: 1.0,
                                  ),
                                ),
                                child: TextField(
                                  onChanged: (value) {
                                    alarmDescription = value;
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 16.0),
                                    hintText: 'e.g., Wake Up For Workout',
                                    hintStyle: TextStyle(
                                      color: Colors.purple.shade500
                                          .withOpacity(.5),
                                    ),
                                  ),
                                  style: const TextStyle(
                                    color: Colors.purple,
                                  ),
                                  maxLines: 10,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Buttons(
                                    screenWidth: screenWidth,
                                    text: "Cancel",
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    AlarmHelper().insertAlarm(AlarmDataModel(
                                        alarmID: 1,
                                        alarmName: alarmName,
                                        alarmAvailable:
                                            stateOfSnooze.toString(),
                                        description: alarmDescription,
                                        alarmDate: selectedDate.toString(),
                                        alarmTime: selectedTime.toString(),
                                        colorIndex: '0'));

                                    showToast(
                                      context: context,
                                      text: 'Alarm Added Successfully',
                                      alignment: const Alignment(.3, .7),
                                      duration:
                                          const Duration(milliseconds: 1000),
                                      textStyle: const TextStyle(
                                          fontSize: 20, color: Colors.white),
                                      color: Colors.purple,
                                    );
                                  },
                                  child: Buttons(
                                    screenWidth: screenWidth,
                                    text: "Save",
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    if (_showCalender)
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Constances.primaryAppColor),
                          child: SfDateRangePicker(
                            enablePastDates: false,
                            selectionMode: DateRangePickerSelectionMode.single,
                            confirmText: 'Ok',
                            showActionButtons: true,
                            onSubmit: (value) {
                              DateTime dateTime =
                                  DateTime.parse(value.toString());

                              selectedDate = DateTimeFormat.format(dateTime,
                                  format: 'd , M');
                              //
                              print("valus is $selectedDate");
                              _showCalender = false;
                              setState(() {});
                            },
                            onCancel: () {
                              _showCalender = false;
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            )
          ],
        ),
      ]),
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
    required this.screenWidth,
    required this.text,
  });

  final double screenWidth;
  final text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * .25,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.purple, Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(12.0),
      // Adjust the padding as needed
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class GradientText extends StatelessWidget {
  final text;

  const GradientText({required this.text});

  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = const LinearGradient(
      colors: <Color>[Colors.purple, Colors.white],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    return RichText(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.06,
          foreground: Paint()..shader = linearGradient,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
