import 'package:flutter/material.dart';
import 'package:code_input/code_input.dart';

class EnterRoomCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Code input',
      color: Colors.deepOrange,
      home: Scaffold(
          body: Center(child: CodeInputWithFocus())
      ),
    );
  }
}

class CodeInputWithFocus extends StatefulWidget {
  @override
  _CodeInputWithFocusState createState() => _CodeInputWithFocusState();
}

class _CodeInputWithFocusState extends State<CodeInputWithFocus> {

  FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
    myFocusNode.requestFocus();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CodeInput(
      length: 4,
      keyboardType: TextInputType.number,
      builder: CodeInputBuilders.darkCircle(),
      onFilled: (value) => print('Your input is $value.'),
      focusNode: myFocusNode,
    );
  }
}