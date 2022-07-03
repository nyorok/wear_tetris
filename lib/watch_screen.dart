import 'package:tetris/ui/game.dart';
import 'package:flutter/material.dart';
import 'package:wear/wear.dart';

class WatchScreen extends StatelessWidget {
  const WatchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WatchShape(builder: (context, shape, child) => Game(shape: shape)),
    );
  }
}
