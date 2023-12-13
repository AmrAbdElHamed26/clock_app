import 'dart:async';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/utils/constances.dart';
import '../component/left_items.dart';
import '../controller/clock_bloc.dart';


class ClockView extends StatefulWidget {
  const ClockView({Key? key}) : super(key: key);

  @override
  State<ClockView> createState() => _ClockViewState();
}


class _ClockViewState extends State<ClockView> {
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClockBloc()..add(const ChangePageEvent(pageNumber: 0)),
      child: Row(
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
      ),
    );
  }
}

