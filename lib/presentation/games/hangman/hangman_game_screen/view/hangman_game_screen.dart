import 'package:flutter/material.dart';
import 'package:game_app/core/constants/colors.dart';
import 'package:game_app/core/constants/global_text_style.dart';
import 'package:game_app/presentation/common_screen/view/score_screen.dart';

import '../../../../common_screen/view/level_screen.dart';
import '../../hangman_datas/hangman_datas.dart';

class HangmanGameScreen extends StatefulWidget {
  final List<Map<String, String>> questions;

  HangmanGameScreen({required this.questions});

  @override
  _HangmanGameScreenState createState() => _HangmanGameScreenState();
}

class _HangmanGameScreenState extends State<HangmanGameScreen> {
  int currentQuestionIndex = 0;
  String currentAnswer = '';
  Set<String> guessedLetters = {};
  int incorrectGuesses = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    loadNextQuestion();
  }

  void loadNextQuestion() {
    setState(() {
      currentAnswer = widget.questions[currentQuestionIndex]['answer']!;
      guessedLetters.clear();
      incorrectGuesses = 0;
    });
  }

  void guessLetter(String letter) {
    setState(() {
      guessedLetters.add(letter);
      if (!currentAnswer.contains(letter)) {
        incorrectGuesses++;
      }
      if (isGameWon() || isGameOver()) {
        if (isGameWon()) {
          score += 1;
        }
        showEndDialog(isGameWon());
      }
    });
  }

  bool isGameWon() {
    return currentAnswer
        .split('')
        .every((letter) => guessedLetters.contains(letter));
  }

  bool isGameOver() {
    return incorrectGuesses >= 6;
  }

  void showEndDialog(bool won) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(won ? 'You Won!' : 'Game Over'),
          content: Text(
            won
                ? 'Congratulations! You guessed the word correctly.'
                : 'The correct word was: $currentAnswer',
            style: TextStyle(
              color: Color(0xff67729D),
            ),
          ),
          actions: [
            TextButton(
              child: Text('Next'),
              onPressed: () {
                Navigator.of(context).pop();
                if (currentQuestionIndex < widget.questions.length - 1) {
                  setState(() {
                    currentQuestionIndex++;
                    loadNextQuestion();
                  });
                } else {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ScoreScreen(
                              name: LevelScreen(
                                  easy: HangmanGameScreen(
                                      questions: beginnerQuestions),
                                  medium: HangmanGameScreen(
                                      questions: mediumQuestions),
                                  hard: HangmanGameScreen(
                                      questions: expertQuestions)))));
                }
              },
            ),
          ],
        );
      },
    );
  }

  Widget buildLetter(String letter) {
    bool isRevealed = guessedLetters.contains(letter);
    return Container(
      width: 30,
      height: 40,
      alignment: Alignment.center,
      margin: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        isRevealed ? letter : '',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget showWord() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          currentAnswer.split('').map((letter) => buildLetter(letter)).toList(),
    );
  }

  showKeyboard() {
    return GridView.count(
      crossAxisCount: 7,
      shrinkWrap: true,
      children: 'abcdefghijklmnopqrstuvwxyz'.split('').map((letter) {
        return InkWell(
          onTap: guessedLetters.contains(letter)
              ? null
              : () => guessLetter(letter),
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: guessedLetters.contains(letter)
                  ? currentAnswer.contains(letter)
                      ? Colors.green
                      : Colors.red
                  : Color(0xff67729D),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Text(
              letter.toUpperCase(),
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => LevelScreen(
                    easy: HangmanGameScreen(questions: beginnerQuestions),
                    medium: HangmanGameScreen(questions: mediumQuestions),
                    hard: HangmanGameScreen(questions: expertQuestions))));
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(color: ColorTheme.maincolor),
          centerTitle: true,
          title:
              Text('WELCOME TO HANGMAN', style: GlobalTextStyles.secondTittle),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              if (currentQuestionIndex ==
                  0) // welcome message for only the first question

                SizedBox(height: 30),
              Text(
                widget.questions[currentQuestionIndex]['question']!,
                style: GlobalTextStyles.subTitle3,
              ),
              SizedBox(height: 20),
              showWord(),
              SizedBox(height: 20),
              showKeyboard(),
              SizedBox(height: 20),
              Text(
                'Incorrect guesses: $incorrectGuesses',
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
              SizedBox(height: 20),
              Text(
                'Score: $score',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff67729D)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
