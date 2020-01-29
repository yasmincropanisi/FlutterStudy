import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'dart:math';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SafeArea(
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ..._playableButtons(total: 7),
              ],
            )),
          ),
        ),
      ),
    );
  }

  List<FlatButton> _playableButtons({total: int}) {
    var buttons = List<FlatButton>();
    for (int i = 1; i <= total; i++) {
      buttons.add(
        FlatButton(
          shape: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          color: Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0)
              .withOpacity(1.0),
          onPressed: () {
            final player = AudioCache();
            player.play('note$i.wav');
          },
          child: Text(
            'Click me',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }
    return buttons;
  }
}
