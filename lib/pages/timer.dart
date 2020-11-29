import 'package:flutter/material.dart';
import 'package:game_timer/widgets/countdown-timer.dart';
import 'package:game_timer/widgets/player-list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_database/firebase_database.dart';


class TimerPage extends StatefulWidget {
  TimerPage({Key key, this.roomCode}) : super(key: key);

  final String roomCode;
  final databaseReference = FirebaseDatabase.instance.reference();

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {

  @override
  void initState() {
    super.initState();
    // ensure this room exists
    widget.databaseReference.child(widget.roomCode).runTransaction((mutableData) async {
      mutableData.value = mutableData.value ?? {
        'name': widget.roomCode,
        'players': [
          {
            'id': '123',
            'name': 'player 1'
          }
        ]
      };
      return mutableData;
    }).then((value) => {});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Timer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(flex: 1, child: PlayerList(roomCode: widget.roomCode)),
            Expanded(flex: 1, child: Center(child: CountdownTimer())),
            Flexible(
              flex: 1,
              child: SizedBox.expand(
                child: RaisedButton(
                  child: Text('Next Player'),
                  onPressed: () => print('next player!'),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('hi'),
        tooltip: 'Increment',
        child: Icon(Icons.pause),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
