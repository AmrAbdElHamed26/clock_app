import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/clock_bloc.dart';

class IconComponent extends StatelessWidget {
  final String iconName, iconPath;

  final int iconNumber;

  final bool selected;

  const IconComponent(
      {super.key,
      required this.iconName,
      required this.iconPath,
      required this.iconNumber,
      required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(topRight: Radius.circular(20)),
        color: selected ? const Color(0xFF242634) : Colors.transparent,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: GestureDetector(
            onTap: () {
              BlocProvider.of<ClockBloc>(context)
                  .add(ChangePageEvent(pageNumber: iconNumber));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(iconPath),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    iconName,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
