import 'package:tetris/models/block.dart';
import 'package:flutter/material.dart';

import 'grid_cell.dart';

class TetrisGrid extends StatelessWidget {
  const TetrisGrid({
    Key? key,
    required this.squareSize,
    required this.blocks,
    required this.totalBlocks,
  }) : super(key: key);
  final double squareSize;
  final List<List<Block>> blocks;
  final int totalBlocks;

  @override
  Widget build(BuildContext context) {
    var size = squareSize;

    return Container(
      height: size,
      width: size,
      decoration: const BoxDecoration(color: Colors.black26),
      child: Column(
        children: blocks
            .map((e) => Row(
                  children: e
                      .map((block) =>
                          GridCell(size: size / totalBlocks, block: block))
                      .toList(),
                ))
            .toList(),
      ),
    );
  }
}
