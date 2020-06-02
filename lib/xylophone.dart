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

class Key extends StatefulWidget {
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

  static AudioCache player = AudioCache();

  @override
  _KeyState createState() => _KeyState();
}

class _KeyState extends State<Key> with SingleTickerProviderStateMixin {
  final AudioPlayer audioPlayer = AudioPlayer();
  double _scale;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 50),
      lowerBound: 0.0,
      upperBound: 0.02,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
    Key.player.play('sounds/xylophone-${widget.note}.wav');
    print('${widget.note} tapped');
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      child: Transform.scale(
        scale: _scale,
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: widget.color,
          ),
          width: widget.w,
          height: widget.h,
        ),
      ),
    );
  }
}
