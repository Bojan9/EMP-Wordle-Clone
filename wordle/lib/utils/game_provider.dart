import 'dart:math';

// IMPORT DATA
import 'package:wordle/data/words_en_five.dart';
import 'package:wordle/data/words_en_six.dart';
import 'package:wordle/data/words_en_seven.dart';
import 'package:wordle/data/words_slo_five.dart';
import 'package:wordle/data/words_slo_six.dart';
import 'package:wordle/data/words_slo_seven.dart';
import 'package:wordle/data/words_mk_five.dart';
import 'package:wordle/data/words_mk_six.dart';
import 'package:wordle/data/words_mk_seven.dart';
import '../data/countries.dart';

import 'package:wordle/data/globals.dart';

class WorldeGame {
  
  /*
  SETTING GAME VARIABLES
  */ 
  int rowId = 0;
  int letterId = 0;

  static String game_message = "";
  static String game_guess = "";

  static bool gameOver = false;

  // SETTING LIST OF WORDS FOR LANGUAGE
  static List<String> language(String lan, int len) {
    if (lan == "EN") {
      if (len == 5) {
        return word_list_en_5;
      } else if (len == 6) {
        return word_list_en_6;
      } else if (len == 7){
        return word_list_en_7;
      } else {
        return word_list_en_5;
      }
    } else if (lan == "SL") {
      if (len == 5) {
        return word_list_slo_5;
      } else if (len == 6) {
        return word_list_slo_6;
      } else if (len == 7){
        return word_list_slo_7;
      } else {
        return word_list_slo_5;
      }
    } else if (lan == "MK") {
      if (len == 5) {
        return word_list_mk_5;
      } else if (len == 6) {
        return word_list_mk_6;
      } else if (len == 7){
        return word_list_mk_7;
      } else {
        return word_list_mk_5;
      }
    } else {
      return word_list_en_5_country;
    }
  }

  // SETTING GAME ROW
  static List<Letter> wordleRow = List.generate(
    len,
    (index) => Letter("", 0),
  );

  // SETTING GAMEBOARD
  List<List<Letter>> wordleBoard = List.generate(
      5,
      (index) => List.generate(
            len,
            (index) => Letter("", 0),
          ));

  // SETTING THE GAME FUNCTION
  void passTry() {
    rowId++;
    letterId = 0;
  }

  static void initGame() {
    final random = new Random();
    int index = random.nextInt(language(lan, len).length);
    game_guess = language(lan, len)[index].toUpperCase();
  }

  // SETTING THE GAME INSERTION
  void insertWord(index, word) {
    wordleBoard[rowId][index] = word;
  }

  // CHECKING WORD
  bool checkWordExist(String word) {
    return language(lan, len).contains(word);
  }
}

class Letter {
  String? letter;
  int code = 0;

  Letter(this.letter, this.code);
}