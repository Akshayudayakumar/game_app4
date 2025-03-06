import 'package:flutter/material.dart';
import 'package:game_app/core/constants/colors.dart';
import 'package:game_app/core/constants/global_text_style.dart';
import 'package:game_app/presentation/common_screen/view/score_screen.dart';
import 'package:game_app/presentation/games/gk/gk_data/gk_data.dart';
import 'package:game_app/presentation/games/gk/gk_quiz_screen/model/gk_quiz_model.dart';
import '../../../../common_screen/view/level_screen.dart';

class QuizScreen extends StatefulWidget {
  final String difficulty;

  QuizScreen({required this.difficulty});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late List<Question> questions;
  int currentQuestionIndex = 0;
  bool answered = false;
  int selectedOptionIndex = -1;
  int score = 0; // Track the score

  @override
  void initState() {
    super.initState();
    questions = fetchQuestions(widget.difficulty);
    print("Number of questions: ${questions.length}");
  }

  void handleAnswer(int index) {
    if (answered) return;
    setState(() {
      answered = true;
      selectedOptionIndex = index;
      if (index == questions[currentQuestionIndex].correctOptionIndex) {
        score++; // Increase score if the answer is correct
      }
    });
  }

  void nextQuestion() {
    setState(() {
      if (currentQuestionIndex < 9) {
        currentQuestionIndex++;
        answered = false;
        selectedOptionIndex = -1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Question currentQuestion = questions[currentQuestionIndex];
    var size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LevelScreen(
              easy: QuizScreen(difficulty: 'easy'),
              medium: QuizScreen(difficulty: 'medium'),
              hard: QuizScreen(difficulty: 'hard'),
            ),
          ),
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title:
              Text("WELCOME TO GK QUIZ", style: GlobalTextStyles.secondTittle),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: ColorTheme.maincolor,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => LevelScreen(
                  easy: QuizScreen(difficulty: 'easy'),
                  medium: QuizScreen(difficulty: 'medium'),
                  hard: QuizScreen(difficulty: 'hard'),
                ),
              ));
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.center, 
              children: [
                Text(
                  "Question ${currentQuestionIndex + 1}: ${currentQuestion.questionText}",
                  style: GlobalTextStyles.subTitle3,
                  textAlign: TextAlign.center, 
                ),
                SizedBox(height: size.height * .05),
                Column(
                  children:
                      currentQuestion.options.asMap().entries.map((entry) {
                    int idx = entry.key;
                    String option = entry.value;
                    return GestureDetector(
                      onTap: () => handleAnswer(idx),
                      child: Container(
                        width: double.infinity, 
                        alignment: Alignment.center, 
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: answered
                              ? (idx == selectedOptionIndex
                                  ? (idx == currentQuestion.correctOptionIndex
                                      ? Colors.green
                                      : Colors.red)
                                  : (idx == currentQuestion.correctOptionIndex
                                      ? Colors.green
                                      : Colors.white))
                              : Colors.white,
                          border: Border.all(color: ColorTheme.maincolor),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          option,
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: size.height * .02),
                Text("Score: $score", // Display the score
                    style: GlobalTextStyles.thirdTittle),
                SizedBox(height: size.height * .1),
                Container(
                  height: size.height * 0.05,
                  width: size.width * 0.20,
                  child: ElevatedButton(
                    onPressed: () {
                      if (currentQuestionIndex == 9) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ScoreScreen(
                              name: LevelScreen(
                                easy: QuizScreen(difficulty: 'easy'),
                                medium: QuizScreen(difficulty: 'medium'),
                                hard: QuizScreen(difficulty: 'hard'),
                              ),
                            ),
                          ),
                        );
                      } else {
                        if (answered) {
                          nextQuestion(); // Move to the next question
                        }
                      }
                    },
                    child: Text(
                      "OK",
                      style: TextStyle(color: ColorTheme.white), // Text color
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorTheme.maincolor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
