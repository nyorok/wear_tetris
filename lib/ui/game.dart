import 'dart:async';
import 'dart:math';

import 'package:tetris/controller/game_controller.dart';
import 'package:tetris/models/move_direction.dart';
import 'package:tetris/ui/grid/tetris_grid.dart';
import 'package:flutter/material.dart';
import 'package:wear/wear.dart';

class Game extends StatefulWidget {
  const Game({Key? key, required this.shape}) : super(key: key);

  final WearShape shape;

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  late Timer timer;
  var totalBlocks = 15;
  var gameController = GameController(15, 15);

  void start(int speed) =>
      timer = Timer.periodic(Duration(milliseconds: speed), (Timer t) {
        setState(() {
          gameController.handleShapes();

          if (holdingDown) {
            speedGame();
            speedingGame = true;
          } else {
            if (speedingGame) {
              timer.cancel();
              start(1000);
              speedingGame = false;
            }
          }
        });
      });

  bool holdingDown = false;
  bool speedingGame = false;

  speedGame() {
    if (holdingDown) {
      timer.cancel();
      start(100);
    }
  }

  @override
  void initState() {
    super.initState();
    start(1000);
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    var squareSize = cos(pi / 4) * screenSize.width;

    return Center(
      child: Container(
        height: screenSize.height,
        width: screenSize.width,
        decoration:
            const BoxDecoration(color: Colors.black87, shape: BoxShape.circle),
        child: Stack(
          children: <Widget>[
            Align(
                alignment: Alignment.topCenter,
                child: Icon(
                  Icons.restart_alt,
                  size: (screenSize.width - squareSize) / 5,
                  color: Colors.greenAccent,
                )),
            Padding(
              padding: EdgeInsets.all((screenSize.width - squareSize) / 8),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.arrow_circle_right_outlined,
                    size: (screenSize.width - squareSize) / 4,
                    color: Colors.greenAccent,
                  )),
            ),
            Padding(
              padding: EdgeInsets.all((screenSize.width - squareSize) / 8),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.arrow_circle_left_outlined,
                    size: (screenSize.width - squareSize) / 4,
                    color: Colors.greenAccent,
                  )),
            ),
            Padding(
              padding: EdgeInsets.all((screenSize.width - squareSize) / 4),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Tetris / Points: ${gameController.points}",
                    style: const TextStyle(color: Colors.white),
                  )),
            ),
            Padding(
              padding: EdgeInsets.all((screenSize.width - squareSize) / 8),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Icon(
                    Icons.arrow_drop_down_circle,
                    size: (screenSize.width - squareSize) / 4,
                    color: Colors.blueAccent,
                  )),
            ),
            Center(
              child: TetrisGrid(
                  squareSize: squareSize,
                  blocks: gameController.grid,
                  totalBlocks: totalBlocks),
            ),
            Column(
              children: [
                MaterialButton(
                    onPressed: () => {
                          setState(() {
                            gameController.tryTurn();
                          })
                        },
                    height: screenSize.height / (7 / 2),
                    minWidth: screenSize.width,
                    child: const Icon(null)),
                Row(
                  children: [
                    MaterialButton(
                        onPressed: () => {
                              setState(() {
                                gameController.move(MoveDirection.left);
                              })
                            },
                        height: screenSize.height / (7 / 3),
                        minWidth: screenSize.width / 2,
                        child: const Icon(null)),
                    MaterialButton(
                        onPressed: () => {
                              setState(() {
                                gameController.move(MoveDirection.right);
                              })
                            },
                        height: screenSize.height / (7 / 3),
                        minWidth: screenSize.width / 2,
                        child: const Icon(null)),
                  ],
                ),
                MaterialButton(
                  onPressed: () => {},
                  height: screenSize.height / (7 / 2),
                  minWidth: screenSize.width,
                  child: GestureDetector(
                      onTapDown: (_) => setState(() => holdingDown = true),
                      onTapUp: (_) => setState(() => holdingDown = false),
                      child: Container(
                        color: Colors.transparent,
                        width: screenSize.width,
                        height: screenSize.height / (7 / 2),
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
