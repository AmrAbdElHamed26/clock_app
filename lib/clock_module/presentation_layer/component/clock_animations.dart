import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  var dateTime = DateTime.now();

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var fillBrush = Paint()..color = const Color(0XFF444794);
    var outLineBrush = Paint()
      ..color = const Color(0XFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;
    var centerFillBrush = Paint()..color = const Color(0XFFEAECFF);

    var secondBrush = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8;
    var minutesBrush = Paint()
      ..shader = const RadialGradient(
          colors: [Colors.indigo, Colors.pink, Colors.deepOrangeAccent])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeWidth = 12
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    var hoursBrush = Paint()
      ..shader = const RadialGradient(colors: [Colors.blue, Colors.amber])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeWidth = 14
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius - (size.width) / 8, fillBrush);
    canvas.drawCircle(center, radius - (size.width) / 8, outLineBrush);
    var secondX = centerX + 80 * cos(dateTime.second * 6 * pi / 180);
    var secondY = centerX + 80 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secondX, secondY), secondBrush);
    var minuteX = centerX + 75 * cos(dateTime.minute * 6 * pi / 180);
    var minuteY = centerX + 75 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minuteX, minuteY), minutesBrush);
    var hoursX = centerX +
        55 * cos((dateTime.hour * 30 + dateTime.minute * .5) * pi / 180);
    var hoursY = centerX +
        55 * sin((dateTime.hour * 30 + dateTime.minute * .5) * pi / 180);
    canvas.drawLine(center, Offset(hoursX, hoursY), hoursBrush);

    //print("date ${dateTime.hour} ${dateTime.minute} ${dateTime.second}");
    canvas.drawCircle(center, 16, centerFillBrush);
    var outerCircleRadius = radius;
    var innerCircleRadius = radius - 14;

    var dashBrush = Paint()
      ..color = const Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;
    var dashColorBrush = Paint()
      ..color = Colors.redAccent.shade100
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;
    for (double i = 0; i < 360; i += 6) {
      var x1 = centerX + (outerCircleRadius - 3) * cos(i * pi / 180);
      var y1 = centerY + (outerCircleRadius - 3) * sin(i * pi / 180);

      var x2 = centerX + (innerCircleRadius + 2) * cos(i * pi / 180);
      var y2 = centerY + (innerCircleRadius + 2) * sin(i * pi / 180);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }

    for (double i = 0; i < 360; i += 30) {
      var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      var y1 = centerY + outerCircleRadius * sin(i * pi / 180);

      var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerY + innerCircleRadius * sin(i * pi / 180);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashColorBrush);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
