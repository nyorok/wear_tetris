import 'dart:ui';

import 'package:tetris/models/block.dart';
import 'package:tetris/models/shape_direction.dart';

import 'block_position.dart';

class Shape {
  Shape(
      {required this.blocksDown,
      required this.blocksLeft,
      required this.blocksTop,
      required this.blocksRight,
      this.colIndex = 0,
      this.rowIndex = 0,
      this.blockDirection = BlockDirection.down,
      required this.color});

  BlockDirection blockDirection;

  int colIndex;
  int rowIndex;

  Color color;

  final List<BlockPosition> blocksDown;
  final List<BlockPosition> blocksLeft;
  final List<BlockPosition> blocksTop;
  final List<BlockPosition> blocksRight;

  setCoord(int colIndex, int rowIndex) =>
      {this.colIndex = colIndex, this.rowIndex = rowIndex};

  void turnBlocks() {
    switch (blockDirection) {
      case (BlockDirection.down):
        blockDirection = BlockDirection.left;
        break;
      case (BlockDirection.left):
        blockDirection = BlockDirection.top;
        break;
      case (BlockDirection.top):
        blockDirection = BlockDirection.right;
        break;
      case (BlockDirection.right):
        blockDirection = BlockDirection.down;
        break;
    }
  }

  List<BlockPosition> getBlocks() {
    switch (blockDirection) {
      case (BlockDirection.down):
        return blocksDown;
      case (BlockDirection.left):
        return blocksLeft;
      case (BlockDirection.top):
        return blocksTop;
      case (BlockDirection.right):
        return blocksRight;
    }
    return [];
  }

  bool isMaxRight(List<List<Block>> grid) =>
      getBlocks().any((block) => block.colLine + colIndex == grid.length - 1);
  bool isMaxLeft(List<List<Block>> grid) =>
      getBlocks().any((block) => block.colLine + colIndex == 0);
  bool isMaxDown(List<List<Block>> grid) => getBlocks()
      .any((block) => block.rowLine + rowIndex == grid[0].length - 1);

  bool hasColisionRight(List<List<Block>> grid, BlockPosition block) =>
      grid[block.rowLine + rowIndex][block.colLine + colIndex + 1].on;
  bool hasColisionLeft(List<List<Block>> grid, BlockPosition block) =>
      grid[block.rowLine + rowIndex][block.colLine + colIndex - 1].on;
  bool hasColisionDown(List<List<Block>> grid, BlockPosition block) {
    var value = grid[block.rowLine + rowIndex + 1][block.colLine + colIndex].on;
    return value;
  }

  bool hasColisionOn(List<List<Block>> grid, BlockPosition block) {
    if (0 > block.colLine + colIndex || 0 > block.rowLine + rowIndex) {
      return true;
    }
    if (grid.length - 1 < block.rowLine + rowIndex) return true;
    if (grid[block.rowLine + rowIndex].length - 1 < block.colLine + colIndex) {
      return true;
    }

    return grid[block.rowLine + rowIndex][block.colLine + colIndex].on;
  }
}
