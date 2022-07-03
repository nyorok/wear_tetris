import 'package:tetris/models/block.dart';
import 'package:flutter/material.dart';

class GridCell extends StatelessWidget {
  const GridCell({Key? key, required this.size, required this.block})
      : super(key: key);

  final double size;
  final Block block;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.4),
      child: Container(
        height: size - 0.8,
        width: size - 0.8,
        color: block.color,
      ),
    );
  }
}
