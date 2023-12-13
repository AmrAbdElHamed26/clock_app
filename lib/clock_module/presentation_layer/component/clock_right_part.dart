import 'dart:async';
import 'dart:math';

import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'clock_animations.dart';


class ClockRightPart extends StatefulWidget {
  const ClockRightPart({Key? key}) : super(key: key);

  @override
  State<ClockRightPart> createState() => _ClockRightPartState();
}

class _ClockRightPartState extends State<ClockRightPart> {

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var time = DateTimeFormat.format(now, format: 'H:i');
    var date = DateTimeFormat.format(now, format: 'D , M j');

    return Expanded(
      flex: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15, top: 50, bottom: 80),
            child: Text(
              "Clock",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              time,
              style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFFFFF)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 25),
            child: Text(date,
                style: const TextStyle(
                    fontSize: 20, color: Color(0xFFFFFFFF))),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: SizedBox(
              width: 300,
              height: 300,
              child: Transform.rotate(
                angle: -pi / 2,
                child: CustomPaint(
                  painter: ClockPainter(),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
         Padding(
           padding: const EdgeInsets.only(left:8.0),

           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               const Text("Time Zone",
                   style: TextStyle(fontSize: 30, color: Color(0xFFFFFFFF))),
               Row(
                 children: [

                   const Icon(
                     Icons.language,
                     color: Color(0xFFFFFFFF),
                   ),
                   Text(
                       'UTC + ${now.timeZoneOffset.toString().split('.').first}',
                       style: const TextStyle(
                           fontSize: 15, color: Color(0xFFFFFFFF))),
                 ],
               ),
             ],
           ),
         )
        ],
      ),
    );
  }
}
