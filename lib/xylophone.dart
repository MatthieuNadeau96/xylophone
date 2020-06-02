import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class Xylophone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: width,
        height: height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Key(
              h: height * .9,
              w: width * .1025,
              color: Colors.red,
              note: 'c',
            ),
            SizedBox(width: 10),
            Key(
              h: height * .85,
              w: width * .1025,
              color: Colors.orange,
              note: 'd',
            ),
            SizedBox(width: 10),
            Key(
              h: height * .8,
              w: width * .1025,
              color: Colors.yellow,
              note: 'e',
            ),
            SizedBox(width: 10),
            Key(
              h: height * .75,
              w: width * .1025,
              color: Colors.lightGreen,
              note: 'f',
            ),
            SizedBox(width: 10),
            Key(
              h: height * .7,
              w: width * .1025,
              color: Colors.green,
              note: 'g',
            ),
            SizedBox(width: 10),
            Key(
              h: height * .65,
              w: width * .1025,
              color: Colors.lightBlue,
              note: 'a',
            ),
            SizedBox(width: 10),
            Key(
              h: height * .6,
              w: width * .1025,
              color: Colors.blue,
              note: 'b',
            ),
            SizedBox(width: 10),
            Key(
              h: height * .55,
              w: width * .1025,
              color: Colors.purple,
              note: 'c2',
            ),
          ],
        ),
      ),
    );
  }
}

class Key extends StatelessWidget {
  final Color color;
  final String note;
  final double h;
  final double w;
  Key({
    this.color,
    this.note,
    this.h,
    this.w,
  });

  final AudioPlayer audioPlayer = AudioPlayer();
  static AudioCache player = AudioCache();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        player.play('sounds/xylophone-$note.wav');

        print('$note tapped');
      },
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color,
        ),
        width: w,
        height: h,
      ),
    );
  }
}
