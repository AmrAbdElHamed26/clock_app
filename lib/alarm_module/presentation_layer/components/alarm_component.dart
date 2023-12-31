import 'package:clock_app/alarm_module/domain_layer/entities/alarm.dart';
import 'package:clock_app/alarm_module/presentation_layer/controller/alarm_bloc.dart';
import 'package:clock_app/shared/services/alarm_local_data_base.dart';
import 'package:clock_app/shared/utils/constances.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../shared/utils/custom_colors.dart';

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

class AlarmsListView extends StatefulWidget {
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
  State<AlarmsListView> createState() => _AlarmsListViewState();
}

class _AlarmsListViewState extends State<AlarmsListView> {
  Map _showDetailsStates = {};

  @override
  void initState() {
    print(widget.alarmData.length);
    for (int i = 0; i < widget.alarmData.length; i++) {
      _showDetailsStates.addAll({widget.alarmData[i].alarmID:false});

    }
    super.initState();
  }


  @override
  void didUpdateWidget(AlarmsListView oldWidget) {
    for (int i = 0; i < widget.alarmData.length; i++) {
      _showDetailsStates.addAll({widget.alarmData[i].alarmID:false});

    }
  }

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
                  padding: EdgeInsets.symmetric(
                      vertical: widget.screenHeight * .000001),
                  child: Dismissible(
                    key: Key(widget.alarmData[index].alarmID.toString()),
                    direction: DismissDirection.horizontal,
                    onDismissed: (direction) {
                      setState(() {
                        /// todo : store data before removing it from widget tree , then remove from data base
                        AlarmDetails removedAlarm =
                            widget.alarmData.removeAt(index);
                        AlarmHelper().delete(removedAlarm.alarmID);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          bottom: widget.screenHeight * .05,
                          right: widget.screenWidth * .01),
                      padding: EdgeInsets.symmetric(
                          horizontal: widget.screenWidth * 0.04,
                          vertical: widget.screenHeight * 0.02),
                      width: double.infinity,
                      decoration: widget.alarmData[index].alarmState == "true"
                          ? BoxDecoration(
                              gradient: LinearGradient(
                                colors: GradientColors.allColors[int.parse(
                                    widget.alarmData[index].colorIndex)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      GradientColors.sea.last.withOpacity(0.2),
                                  blurRadius: 5,
                                  spreadRadius: 3,
                                  offset: const Offset(1, 1),
                                ),
                              ],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(24)),
                            )
                          : BoxDecoration(
                              color: Colors.grey,
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      GradientColors.sea.last.withOpacity(0.2),
                                  blurRadius: 5,
                                  spreadRadius: 3,
                                  offset: const Offset(1, 1),
                                ),
                              ],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(24)),
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
                                    size: widget.screenWidth * 0.06,
                                  ),
                                  SizedBox(
                                    width: widget.screenHeight * 0.01,
                                  ),
                                  Text(
                                    widget.alarmData[index].alarmName,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: widget.screenWidth * 0.05),
                                  ),
                                ],
                              ),
                              Switch(
                                value:
                                    widget.alarmData[index].alarmState == "true"
                                        ? true
                                        : false,
                                onChanged: (bool value) {
                                  String newState =
                                      widget.alarmData[index].alarmState ==
                                              "true"
                                          ? "false"
                                          : "true";
                                  AlarmHelper().updateAlarm(
                                      widget.alarmData[index].alarmID,
                                      Constances.kColumnAlarmState,
                                      newState);
                                  BlocProvider.of<AlarmBloc>(context)
                                      .add(GetAllAlarmsEvent());

                                  /// todo : swap left or right to remove the alarm
                                  setState(() {});
                                },
                                activeColor: Colors.white,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: widget.screenHeight * 0.00001,
                          ),
                          Text(
                            widget.alarmData[index].alarmDate,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: widget.screenWidth * 0.05,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: widget.screenHeight * 0.002,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.alarmData[index].alarmTime,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: widget.screenWidth * 0.08,
                                    fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                onPressed: () {
                                    _showDetailsStates[widget.alarmData[index].alarmID]= !_showDetailsStates[widget.alarmData[index].alarmID]!;
                                    setState(() {});

                                },
                                icon: Icon(
                                  Icons.expand_circle_down,
                                  color: Colors.white,
                                  size: widget.screenWidth * 0.06,
                                ),
                              ),
                            ],
                          ),
                          if (_showDetailsStates[widget.alarmData[index].alarmID] == true)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Description",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                    widget.alarmData[index].description,
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.white),
                                    maxLines: 10,
                                  ),
                                ],
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: widget.alarmData.length,
      ),
    );
  }
}
