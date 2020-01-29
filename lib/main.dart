import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'dart:math';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ..._playableButtons(total: 7),
                ],
              )),
        ),
      ),
    );
  }

  List<Expanded> _playableButtons({total: int}) {
    var buttons = List<Expanded>();
    for (int i = 1; i <= total; i++) {
      buttons.add(
        _buildPlayableButton(audio: 'note$i.wav'),
      );
    }
    return buttons;
  }

  Expanded _buildPlayableButton({audio: String}) {
    return Expanded(
      child: FlatButton(
        color: Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0)
            .withOpacity(1.0),
        onPressed: () {
          final player = AudioCache();
          player.play(audio);
        },
        child: Text(
          '',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
