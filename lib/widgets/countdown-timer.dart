import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {
  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {

  @override
  Widget build(BuildContext context) {
    return Text(
      '12:34',
      style: TextStyle(fontSize: 64),
    );
  }
}