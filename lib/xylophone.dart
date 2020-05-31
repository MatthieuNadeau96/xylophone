import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class Xylophone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Key(Colors.pink),
          Key(Colors.purple),
          Key(Colors.blue),
          Key(Colors.green),
          Key(Colors.yellow),
          Key(Colors.orange),
          Key(Colors.red),
        ],
      ),
    );
  }
}

class Key extends StatelessWidget {
  final Color color;
  Key(this.color);

  AudioPlayer audioPlayer = AudioPlayer();
  static AudioCache player = AudioCache();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          player.play('sounds/xylophone-b.wav');

          print('$color tapped');
        },
        child: Container(
          color: color,
        ),
      ),
    );
  }
}
