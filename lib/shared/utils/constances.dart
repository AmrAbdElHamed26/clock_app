import 'dart:ui';

import 'package:clock_app/clock_module/presentation_layer/component/clock_right_part.dart';

import '../../alarm_module/presentation_layer/screens/alarm_screen.dart';

var  screens = [ ClockRightPart() , AlarmScreen() ];

class Constances {
  static const String kTableAlarm = 'alarm';
  static const String kColumnId = 'id';
  static const String kColumnTitle = 'title';
  static const String kColumnDateTime = 'alarmDateTime';
  static const String kColumnPending = 'isPending';
  static const String kColumnColorIndex = 'gradientColorIndex';
  static const String kColumnDescription = 'description';

  static const Color primaryAppColor = Color(0xFF2D2F41);
}