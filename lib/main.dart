import 'package:clock_app/shared/services/bloc_observer.dart';
import 'package:clock_app/shared/services/services_locator.dart';
import 'package:clock_app/shared/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'clock_module/presentation_layer/controller/clock_bloc.dart';
import 'clock_module/presentation_layer/screens/clock_screen.dart';
import 'package:clock_app/shared/utils/themes.dart';

void main() {
  ServiceLocator().init();
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<ClockBloc>()..add(const ChangePageEvent(pageNumber: 0)),
        child: Container(
            alignment: Alignment.center,
            color: const Color(0xFF2D2F41),
            child: const ClockView()),
      ),
    );
  }

}