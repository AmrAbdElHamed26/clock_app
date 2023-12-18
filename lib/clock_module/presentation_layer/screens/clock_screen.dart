import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/utils/constances.dart';
import '../component/left_items.dart';
import '../controller/clock_bloc.dart';


class ClockView extends StatelessWidget {
  const ClockView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const LeftItems(),
        Container(
          color: const Color(0xFF484B68),
          width: 1,
          height: double.infinity,
        ),
        BlocBuilder<ClockBloc , ClockState>(
          builder: (context , state) {
           if(state is CurrentPageChangedState) {
             return screens[state.pageNumber];
           } else {
             return screens[0];
           }
          }
        ),
      ],
    );
  }
}

