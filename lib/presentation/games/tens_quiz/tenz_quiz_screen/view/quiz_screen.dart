import 'dart:async';
import 'package:flutter/material.dart';
import 'package:game_app/core/constants/colors.dart';
import 'package:game_app/core/constants/global_text_style.dart';
import '../../../../common_screen/view/level_screen.dart';
import '../../../../common_screen/view/score_screen.dart';
import '../../tens_quiz_datas/quiz datas.dart';

class TenseQuizScreen extends StatefulWidget {
  final List<Map<String, dynamic>> questions;

  const TenseQuizScreen({Key? key, required this.questions}) : super(key: key);

  @override
  _TenseQuizScreenState createState() => _TenseQuizScreenState();
}

class _TenseQuizScreenState extends State<TenseQuizScreen> {
  late List<Map<String, dynamic>> shuffledQuestions;
  int currentQuestionIndex = 0;
  String userAnswer = '';
  String feedbackMessage = '';
  int button = 0;
  var i = 1;
  int score = 0;
  late var answer = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Shuffle the questions
    shuffledQuestions = List.from(widget.questions)..shuffle();
  }

  void checkAnswer() {
    if (currentQuestionIndex == 9) {
      if (userAnswer.toLowerCase() ==
          shuffledQuestions[currentQuestionIndex]['answer'].toLowerCase()) {
        feedbackMessage = 'Correct!';
        score++;
      } else {
        feedbackMessage =
            "Wrong! The correct answer is '${shuffledQuestions[currentQuestionIndex]['answer']}'";
      }
      setState(() {
        button = 1;
        userAnswer = '';
        answer.clear();
      });
    } else {
      if (userAnswer.toLowerCase() ==
          shuffledQuestions[currentQuestionIndex]['answer'].toLowerCase()) {
        feedbackMessage = 'Correct!';
        score++;
      } else {
        feedbackMessage =
            "Wrong! The correct answer is '${shuffledQuestions[currentQuestionIndex]['answer']}'";
      }
      setState(() {
        currentQuestionIndex++;
        i++;
        userAnswer = '';
        answer.clear();
      });
    }
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
                    easy: TenseQuizScreen(questions: beginner),
                    medium: TenseQuizScreen(questions: medium),
                    hard: TenseQuizScreen(questions: expert))));
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title:
              Text("WELCOME TO TENSE ", style: GlobalTextStyles.secondTittle),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: ColorTheme.maincolor,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LevelScreen(
                      easy: TenseQuizScreen(questions: beginner),
                      medium: TenseQuizScreen(questions: medium),
                      hard: TenseQuizScreen(questions: expert))));
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "$i. ${shuffledQuestions[currentQuestionIndex]['question']}",
                  style: GlobalTextStyles.subTitle3,
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: size.width * .75,
                height: 50,
                decoration: BoxDecoration(
                  color: ColorTheme.primarycolor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  textInputAction: TextInputAction.next,
                  controller: answer,
                  onChanged: (value) {
                    userAnswer = value;
                  },
                  style: TextStyle(color: ColorTheme.maincolor),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: "Enter Your Answer",
                      hintStyle:
                          TextStyle(color: ColorTheme.lightgrey, fontSize: 15)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              feedbackMessage == 'Correct!'
                  ? Text(feedbackMessage, style: TextStyle(color: Colors.green))
                  : Text(feedbackMessage, style: TextStyle(color: Colors.red)),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Score: $score",
                      style: GlobalTextStyles.subTitle3,
                    ),
                    Container(
                      height: size.height * .05,
                      width: size.width * .20,
                      child: ElevatedButton(
                          onPressed: () {
                            if (currentQuestionIndex == 9) {
                              button == 0 ? checkAnswer() : null;
                              Timer(Duration(seconds: 5), () {
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                        builder: (context) => ScoreScreen(
                                              name: LevelScreen(
                                                  easy: TenseQuizScreen(
                                                      questions: beginner),
                                                  medium: TenseQuizScreen(
                                                      questions: medium),
                                                  hard: TenseQuizScreen(
                                                      questions: expert)),
                                            )));
                              });
                            } else {
                              checkAnswer();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: ColorTheme.maincolor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          child: Text(
                            "OK",
                            style: GlobalTextStyles.buttonText,
                          )),
                    ),
                  ],
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
