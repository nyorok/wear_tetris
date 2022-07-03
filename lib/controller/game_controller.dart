import 'package:tetris/models/block.dart';
import 'package:tetris/models/block_position.dart';
import 'package:tetris/models/move_direction.dart';
import 'package:tetris/models/shape.dart';
import 'package:tetris/models/shapes.dart';
import 'package:flutter/material.dart';

class GameController {
  GameController(this.gridSizeRows, this.gridSizeCols) {
    grid = List.filled(
        gridSizeCols,
        growable: true,
        List.filled(gridSizeRows, Block(false), growable: true));
  }

  late List<List<Block>> grid;
  int gridSizeRows;
  int gridSizeCols;
  int points = 0;
  Shape? shape;

  handleShapes() {
    checkFullLine();
    var hasMoved = move(MoveDirection.down);
    if (!hasMoved) {
      var randomShape = Shapes().getRandom()(gridSizeCols ~/ 2, 0);
      if (canDrawShape(randomShape)) {
        shape = randomShape;
        manageShape(drawShape: true);
      } else {
        points = 0;
        grid = List.filled(
            gridSizeCols,
            growable: true,
            List.filled(gridSizeRows, Block(false), growable: true));
      }
    }
  }

  checkFullLine() {
    grid.asMap().forEach((rowLine, rows) {
      if (rows.every((block) => block.on)) {
        deleteRow(rowLine);
      }
    });
  }

  bool move(MoveDirection direction) {
    if (shape == null) return false;

    if (canMove(direction, shape!)) {
      // Move Block
      switch (direction) {
        case MoveDirection.right:
          shape!.setCoord(shape!.colIndex + 1, shape!.rowIndex);
          //block.colLine += 1;
          break;
        case MoveDirection.left:
          shape!.setCoord(shape!.colIndex - 1, shape!.rowIndex);
          //block.colLine -= 1;
          break;
        case MoveDirection.down:
          shape!.setCoord(shape!.colIndex, shape!.rowIndex + 1);
          //block.rowLine += 1;
          break;
      }
      manageShape(drawShape: true);
      return true;
    } else {
      return false;
    }
  }

  bool canDrawShape(Shape shape) {
    var hasColision =
        shape.getBlocks().any((block) => shape.hasColisionOn(grid, block));
    return !hasColision;
  }

  bool canMove(MoveDirection direction, Shape shape) {
    bool isMovable = true;

    manageShape(undrawShape: true);
    switch (direction) {
      case MoveDirection.right:
        if (shape.isMaxRight(grid)) {
          isMovable = false;
        } else {
          if (shape
              .getBlocks()
              .any((block) => shape.hasColisionRight(grid, block))) {
            isMovable = false;
          }
        }
        break;
      case MoveDirection.left:
        if (shape.isMaxLeft(grid)) {
          isMovable = false;
        } else {
          if (shape
              .getBlocks()
              .any((block) => shape.hasColisionLeft(grid, block))) {
            isMovable = false;
          }
        }
        break;
      case MoveDirection.down:
        if (shape.isMaxDown(grid)) {
          isMovable = false;
        } else {
          if (shape
              .getBlocks()
              .any((block) => shape.hasColisionDown(grid, block))) {
            isMovable = false;
          }
        }
        break;
    }
    if (isMovable) {
      return true;
    } else {
      manageShape(drawShape: true);
      if (direction == MoveDirection.down) this.shape = null;
      return false;
    }
  }

  void manageShape({bool undrawShape = false, bool drawShape = false}) {
    if (undrawShape) {
      for (var block in shape!.getBlocks()) {
        setGridCell(block, Block(false), shape!.colIndex, shape!.rowIndex);
      }
    }
    if (drawShape) {
      for (var block in shape!.getBlocks()) {
        setGridCell(block, Block(true, color: shape!.color), shape!.colIndex,
            shape!.rowIndex);
      }
    }
  }

  void tryTurn() {
    if (shape == null) return;
    var newShape = Shape(
        blocksDown: shape!.blocksDown.toList(),
        blocksLeft: shape!.blocksLeft.toList(),
        blocksTop: shape!.blocksTop.toList(),
        blocksRight: shape!.blocksRight.toList(),
        blockDirection: shape!.blockDirection,
        colIndex: shape!.colIndex,
        rowIndex: shape!.rowIndex,
        color: shape!.color);
    newShape.turnBlocks();

    manageShape(undrawShape: true);
    if (canDrawShape(newShape)) shape = newShape;
    manageShape(drawShape: true);
  }

  deleteRow(int rowLine) {
    points += 15;
    grid.removeAt(rowLine);
    grid.insert(0, List.filled(gridSizeCols, Block(false)));
  }

  setGridCell(
      BlockPosition block, Block cellValue, int colIndex, int rowIndex) {
    var row = grid[block.rowLine + rowIndex].toList();
    row.removeAt(block.colLine + colIndex);
    row.insert(block.colLine + colIndex, cellValue);
    grid.removeAt(block.rowLine + rowIndex);
    grid.insert(block.rowLine + rowIndex, row);
  }
}
