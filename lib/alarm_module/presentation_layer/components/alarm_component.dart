import 'package:clock_app/alarm_module/domain_layer/entities/alarm.dart';
import 'package:clock_app/alarm_module/presentation_layer/controller/alarm_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../shared/utils/custom_colors.dart';
import 'add_alarm_screen.dart';

class AlarmComponent extends StatelessWidget {
  const AlarmComponent({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.alarmData,
  });

  final double screenHeight;
  final double screenWidth;
  final List<AlarmDetails> alarmData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: BlocBuilder<AlarmBloc, AlarmState>(
        builder: (context, state) {
          return AlarmsListView(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              alarmData: alarmData);
        },
      ),
    );
  }
}

class AlarmsListView extends StatelessWidget {
  const AlarmsListView({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.alarmData,
  });

  final double screenHeight;
  final double screenWidth;
  final List<AlarmDetails> alarmData;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 1000),
            child: FlipAnimation(
              child: FadeInAnimation(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: screenHeight * .000001),
                  child: Container(
                    margin: EdgeInsets.only(
                        bottom: screenHeight * .05, right: screenWidth * .01),
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.04,
                        vertical: screenHeight * 0.02),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: GradientColors.fire,
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: GradientColors.sea.last.withOpacity(0.2),
                          blurRadius: 5,
                          spreadRadius: 3,
                          offset: const Offset(1, 1),
                        ),
                      ],
                      borderRadius: const BorderRadius.all(Radius.circular(24)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.article_outlined,
                                  color: Colors.white,
                                  size: screenWidth * 0.06,
                                ),
                                SizedBox(
                                  width: screenHeight * 0.01,
                                ),
                                Text(
                                  alarmData[index].alarmName,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenWidth * 0.05),
                                ),
                              ],
                            ),
                            Switch(
                              value: true,
                              onChanged: (bool value) {},
                              activeColor: Colors.white,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * 0.00001,
                        ),
                        Text(
                          alarmData[index].alarmDateTime,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: screenHeight * 0.002,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              alarmData[index].alarmDateTime,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.08,
                                  fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.expand_circle_down,
                                color: Colors.white,
                                size: screenWidth * 0.06,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: alarmData.length,
      ),
    );
  }
}


/// 1- show a small form data
/// 2- navigate to another screen