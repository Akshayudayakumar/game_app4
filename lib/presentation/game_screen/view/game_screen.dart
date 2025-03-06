import 'package:flutter/material.dart';
import 'package:game_app/core/constants/colors.dart';
import 'package:game_app/core/constants/global_text_style.dart';
import 'package:game_app/presentation/home_screen/view/home_screen.dart';
import '../../common_screen/view/level_screen.dart';
import '../../games/boggle/boggle_game_screen/view/boggle_game_screen.dart';
import '../../games/gk/gk_quiz_screen/view/gk_quiz_screen.dart';
import '../../games/hangman/hangman_datas/hangman_datas.dart';
import '../../games/hangman/hangman_game_screen/view/hangman_game_screen.dart';
import '../../games/tens_quiz/tens_quiz_datas/quiz datas.dart';
import '../../games/tens_quiz/tenz_quiz_screen/view/quiz_screen.dart';
import '../../games/word_puzzle/puzzle_screen/puzzle_screen.dart';
import '../../games/word_puzzle/word_puzzle datas/database.dart';

class GameScreen extends StatelessWidget {
  var images = [
    "assets/images/boggle.jpeg",
    "assets/images/hangmann.png",
    "assets/images/wrdpzzle.png",
    "assets/images/tensequiz.png",
    "assets/images/Gkquiz.png"
  ];
  var screens = [
    LevelScreen(easy: BoggleGameScreen(level: 'easy'), medium: BoggleGameScreen(level: 'medium'),
      hard: BoggleGameScreen(level: 'hard')),
    LevelScreen(easy: HangmanGameScreen(questions: beginnerQuestions), medium: HangmanGameScreen(questions: mediumQuestions),
      hard: HangmanGameScreen(questions: expertQuestions)),
    LevelScreen(easy: PuzzleScreen(words: DbData.easy, level: 'easy',), medium: PuzzleScreen(words: DbData.medium, level: 'medium',),
        hard: PuzzleScreen(words: DbData.hard, level: 'hard',)),
    LevelScreen(easy: TenseQuizScreen(questions: beginner), medium: TenseQuizScreen(questions: medium),
        hard: TenseQuizScreen(questions: expert)),
    LevelScreen(easy: QuizScreen( difficulty: 'easy'), medium: QuizScreen( difficulty: 'medium'),
        hard: QuizScreen( difficulty: 'hard')),
  ];

  @override
  Widget build(BuildContext context) {
    double size = constantsize(context);
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
            HomeScreen()));
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
            HomeScreen()));
          }, icon: Icon(Icons.arrow_back,
          color: ColorTheme.maincolor,)),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text("GAMES", style: GlobalTextStyles.mainTittle),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Align the column center
              children: [
                SizedBox(
                  height: size * 50,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(size * 20, 0, size * 20, 0),
                  child: GridView(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: size * 40,
                      crossAxisSpacing: size * 20,
                      childAspectRatio: 1 / .9,
                    ),
                    children: List.generate(
                        5,
                        (index) => InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => screens[index]));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(size * 20),
                                    image: DecorationImage(
                                        image: AssetImage(images[index]),
                                        fit: BoxFit.fill)),
                              ),
                            )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
