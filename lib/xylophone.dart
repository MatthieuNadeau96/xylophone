import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class Xylophone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Key(
            color: Colors.red,
            note: 'c2',
          ),
          Key(
            color: Colors.orange,
            note: 'b',
          ),
          Key(
            color: Colors.yellow,
            note: 'a',
          ),
          Key(
            color: Colors.lightGreen,
            note: 'g',
          ),
          Key(
            color: Colors.green,
            note: 'f',
          ),
          Key(
            color: Colors.lightBlue,
            note: 'e',
          ),
          Key(
            color: Colors.blue,
            note: 'd',
          ),
          Key(
            color: Colors.purple,
            note: 'c',
          ),
        ],
      ),
    );
  }
}

class Key extends StatelessWidget {
  final Color color;
  final String note;
  Key({this.color, this.note});

  AudioPlayer audioPlayer = AudioPlayer();
  static AudioCache player = AudioCache();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          player.play('sounds/xylophone-$note.wav');

          print('$note tapped');
        },
        child: Container(
          color: color,
        ),
      ),
    );
  }
}
