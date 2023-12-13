import 'package:flutter/material.dart';
import 'clock_module/presentation_layer/screens/clock_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home:  MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget{
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        alignment: Alignment.center,
          color:  const Color(0xFF2D2F41),
          child:  const ClockView()),
    );

  }

}