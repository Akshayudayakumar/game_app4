import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class A2ZProvider extends ChangeNotifier{
   late  bool _isEnabled = false;
  bool get isEnabled => _isEnabled;
  final FlutterTts _tts = FlutterTts();


  Future<void> speak(String letter) async {
    String word = wordExamples[letter] ?? '';
    await _tts.setVolume(1);
    await _tts.setLanguage("EN-IN");
    await _tts.setPitch(1);
    await _tts.setSpeechRate(0.4);
    await _tts.speak("$letter, $word");
  }

  void isToggled(){
    _isEnabled = !_isEnabled;
    notifyListeners();
  }
  Color generateRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }
  Map<String,String> get wordExamples => _wordExamples;

   final Map<String, String> _wordExamples = {
    'A': 'Apple',
    'B': 'Ball',
    'C': 'Cat',
    'D': 'Dog',
    'E': 'Elephant',
    'F': 'Fish',
    'G': 'Grapes',
    'H': 'Home',
    'I': 'Ice-Cream',
    'J': 'Jug',
    'K': 'Kite',
    'L': 'Lion',
    'M': 'Monkey',
    'N': 'Nest',
    'O': 'Orange',
    'P': 'Parrot',
    'Q': 'Queen',
    'R': 'Rabbit',
    'S': 'Sun',
    'T': 'Tiger',
    'U': 'Umbrella',
    'V': 'Van',
    'W': 'Watch',
    'X': 'Xylophone',
    'Y': 'Yak',
    'Z': 'Zebra',
  };

   @override
  notifyListeners();
}