import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class Xylophone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Key(
            color: Colors.red,
            note: 'c',
          ),
          Key(
            color: Colors.orange,
            note: 'd',
          ),
          Key(
            color: Colors.yellow,
            note: 'e',
          ),
          Key(
            color: Colors.lightGreen,
            note: 'f',
          ),
          Key(
            color: Colors.green,
            note: 'g',
          ),
          Key(
            color: Colors.lightBlue,
            note: 'a',
          ),
          Key(
            color: Colors.blue,
            note: 'b',
          ),
          Key(
            color: Colors.purple,
            note: 'c2',
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
