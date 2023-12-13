import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/clock_bloc.dart';
import 'icons_component.dart';

class LeftItems extends StatelessWidget {
  const LeftItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClockBloc , ClockState>(
      builder: (context , state) {
        if(state is CurrentPageChangedState){
          return Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                IconComponent(
                  iconName: "Clock", iconPath: "assets/images/clock_icon.png", iconNumber: 0,selected:(state).pageNumber == 0 ? true : false ,),
                SizedBox(
                  height: 5,
                ),
                IconComponent(
                  iconName: "Alarm", iconPath: "assets/images/alarm_icon.png", iconNumber: 1,selected:(state).pageNumber == 1 ? true : false ,),
                SizedBox(
                  height: 5,
                ),
                IconComponent(
                  iconName: "Timer", iconPath: "assets/images/timer_icon.png", iconNumber: 2,selected:(state).pageNumber == 2 ? true : false ,),
                SizedBox(
                  height: 5,
                ),
                IconComponent(
                  iconName: "StopWatch",
                  iconPath: "assets/images/stopwatch_icon.png" , iconNumber: 3,selected:(state).pageNumber == 3 ? true : false ,),
              ],
            ),
          );
        }
        else {
          return Container();
        }
      }
    );
  }
}
