import 'dart:math';

import 'package:tetris/models/block_position.dart';
import 'package:flutter/material.dart';
import 'shape.dart';

class Shapes {
  Shape Function(int, int) getRandom() {
    var shapes = [getL, getJ, getT, getI, getS, getZ, getO];
    var random = Random();
    return shapes[random.nextInt(shapes.length)];
  }

  Shape getO(int colIndex, int rowIndex) {
    var shape = Shape(blocksDown: [
      BlockPosition(1, 1),
      BlockPosition(1, 2),
      BlockPosition(2, 1),
      BlockPosition(2, 2),
    ], blocksLeft: [
      BlockPosition(1, 1),
      BlockPosition(1, 2),
      BlockPosition(2, 1),
      BlockPosition(2, 2),
    ], blocksTop: [
      BlockPosition(1, 1),
      BlockPosition(1, 2),
      BlockPosition(2, 1),
      BlockPosition(2, 2),
    ], blocksRight: [
      BlockPosition(1, 1),
      BlockPosition(1, 2),
      BlockPosition(2, 1),
      BlockPosition(2, 2),
    ], colIndex: colIndex, rowIndex: rowIndex, color: Colors.yellow);

    return shape;
  }

  Shape getL(int colIndex, int rowIndex) {
    var shape = Shape(blocksDown: [
      BlockPosition(1, 0),
      BlockPosition(1, 1),
      BlockPosition(1, 2),
      BlockPosition(2, 2),
    ], blocksLeft: [
      BlockPosition(1, 1),
      BlockPosition(1, 2),
      BlockPosition(2, 1),
      BlockPosition(3, 1),
    ], blocksTop: [
      BlockPosition(1, 0),
      BlockPosition(2, 0),
      BlockPosition(2, 1),
      BlockPosition(2, 2),
    ], blocksRight: [
      BlockPosition(1, 2),
      BlockPosition(2, 2),
      BlockPosition(3, 2),
      BlockPosition(3, 1),
    ], colIndex: colIndex, rowIndex: rowIndex, color: Colors.orangeAccent);

    return shape;
  }

  Shape getI(int colIndex, int rowIndex) {
    var shape = Shape(blocksDown: [
      BlockPosition(1, 0),
      BlockPosition(1, 1),
      BlockPosition(1, 2),
      BlockPosition(1, 3),
    ], blocksLeft: [
      BlockPosition(0, 1),
      BlockPosition(1, 1),
      BlockPosition(2, 1),
      BlockPosition(3, 1),
    ], blocksTop: [
      BlockPosition(1, 0),
      BlockPosition(1, 1),
      BlockPosition(1, 2),
      BlockPosition(1, 3),
    ], blocksRight: [
      BlockPosition(0, 1),
      BlockPosition(1, 1),
      BlockPosition(2, 1),
      BlockPosition(3, 1),
    ], colIndex: colIndex, rowIndex: rowIndex, color: Colors.blueAccent);

    return shape;
  }

  Shape getJ(int colIndex, int rowIndex) {
    var shape = Shape(blocksDown: [
      BlockPosition(2, 0),
      BlockPosition(2, 1),
      BlockPosition(2, 2),
      BlockPosition(1, 2),
    ], blocksLeft: [
      BlockPosition(1, 1),
      BlockPosition(1, 2),
      BlockPosition(2, 2),
      BlockPosition(3, 2),
    ], blocksTop: [
      BlockPosition(1, 0),
      BlockPosition(1, 1),
      BlockPosition(1, 2),
      BlockPosition(2, 0),
    ], blocksRight: [
      BlockPosition(1, 1),
      BlockPosition(2, 1),
      BlockPosition(3, 1),
      BlockPosition(3, 2),
    ], colIndex: colIndex, rowIndex: rowIndex, color: Colors.pinkAccent);

    return shape;
  }

  Shape getT(int colIndex, int rowIndex) {
    var shape = Shape(blocksDown: [
      BlockPosition(0, 1),
      BlockPosition(1, 1),
      BlockPosition(2, 1),
      BlockPosition(1, 2),
    ], blocksLeft: [
      BlockPosition(1, 0),
      BlockPosition(1, 1),
      BlockPosition(1, 2),
      BlockPosition(0, 1),
    ], blocksTop: [
      BlockPosition(1, 0),
      BlockPosition(0, 1),
      BlockPosition(1, 1),
      BlockPosition(2, 1),
    ], blocksRight: [
      BlockPosition(1, 0),
      BlockPosition(1, 1),
      BlockPosition(2, 1),
      BlockPosition(1, 2),
    ], colIndex: colIndex, rowIndex: rowIndex, color: Colors.purple);

    return shape;
  }

  Shape getS(int colIndex, int rowIndex) {
    var shape = Shape(blocksDown: [
      BlockPosition(0, 2),
      BlockPosition(1, 1),
      BlockPosition(2, 1),
      BlockPosition(1, 2),
    ], blocksLeft: [
      BlockPosition(1, 0),
      BlockPosition(1, 1),
      BlockPosition(2, 1),
      BlockPosition(2, 2),
    ], blocksTop: [
      BlockPosition(0, 2),
      BlockPosition(1, 1),
      BlockPosition(1, 2),
      BlockPosition(2, 1),
    ], blocksRight: [
      BlockPosition(1, 0),
      BlockPosition(1, 1),
      BlockPosition(2, 1),
      BlockPosition(2, 2),
    ], colIndex: colIndex, rowIndex: rowIndex, color: Colors.redAccent);

    return shape;
  }

  Shape getZ(int colIndex, int rowIndex) {
    var shape = Shape(blocksDown: [
      BlockPosition(1, 1),
      BlockPosition(2, 1),
      BlockPosition(2, 2),
      BlockPosition(3, 2),
    ], blocksLeft: [
      BlockPosition(2, 0),
      BlockPosition(2, 1),
      BlockPosition(1, 1),
      BlockPosition(1, 2),
    ], blocksTop: [
      BlockPosition(1, 1),
      BlockPosition(2, 1),
      BlockPosition(2, 2),
      BlockPosition(3, 2),
    ], blocksRight: [
      BlockPosition(2, 0),
      BlockPosition(1, 1),
      BlockPosition(2, 1),
      BlockPosition(1, 2),
    ], colIndex: colIndex, rowIndex: rowIndex, color: Colors.greenAccent);

    return shape;
  }
}
