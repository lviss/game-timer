import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class PlayerList extends StatefulWidget {
  PlayerList({Key key, this.roomCode}) : super(key: key);
  final String roomCode;
  final databaseReference = FirebaseDatabase.instance.reference();

  @override
  _PlayerListState createState() => _PlayerListState();
}

class _PlayerListState extends State<PlayerList> {

  DatabaseReference _playersReference;

  @override
  void initState() {
    super.initState();
    _playersReference = widget.databaseReference.child(widget.roomCode).child('players');
  }

  @override
  Widget build(BuildContext context) {
    return FirebaseAnimatedList(
      query: _playersReference,
      itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index)
      {
        String name = new Map<String, dynamic>.from(snapshot.value)['name'];
        return SizeTransition(
          sizeFactor: animation,
          child: ListTile(
            title: Text(name),
          )
        );
      }
    );
  }
}

class _PlayerListStateHardcoded extends State<PlayerList> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.verified_user),
          title: Text('player 1')
        ),
        ListTile(
            leading: Icon(Icons.umbrella),
            title: Text('player 2')
        ),
        ListTile(
            leading: Icon(Icons.person),
            title: Text('player 3')
        ),
        ListTile(
            leading: Icon(Icons.adjust),
            title: Text('player 4')
        ),
      ]
    );
  }
}