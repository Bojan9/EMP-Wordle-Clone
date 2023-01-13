import 'package:flutter/material.dart';
import 'package:wordle/utils/game_provider.dart';

typedef ResetGame = void Function();

class GameBoard extends StatefulWidget {
  GameBoard(this.game, {Key? key, this.resetGame}) : super(key: key);
  WorldeGame game;
  final ResetGame? resetGame;

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.game.wordleBoard
          .map((e) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: e
                    .map((e) => Container(
                          padding: const EdgeInsets.all(8.0),
                          width: 45.0,
                          height: 45.0,
                          margin: const EdgeInsets.symmetric(vertical: 6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            color: e.code == 0
                                ? Colors.grey.shade800
                                : e.code == 1
                                    ? Colors.green.shade400
                                    : Colors.amber.shade400,
                          ),
                          child: Center(
                              child: Text(
                            e.letter!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ))
                    .toList(),
              ))
          .toList(),
    );
  }
}