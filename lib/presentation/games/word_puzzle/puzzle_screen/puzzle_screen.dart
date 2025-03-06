import 'dart:async';
import 'package:flutter/material.dart';
import 'package:game_app/core/constants/colors.dart';
import 'package:game_app/core/constants/global_text_style.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../common_screen/view/level_screen.dart';
import '../../../common_screen/view/score_screen.dart';
import '../word_puzzle datas/database.dart';

class PuzzleScreen extends StatefulWidget {
  final String level;

  List<Map<String, String>> words;
  PuzzleScreen({super.key, required this.words, required this.level});

  @override
  State<PuzzleScreen> createState() => _PuzzleScreenState();
}

class _PuzzleScreenState extends State<PuzzleScreen> {
  int currentIndex = 0;
  final TextEditingController _controller = TextEditingController();
  String feedback = '';

  void checkAnswer() {
    if (currentIndex != 9) {
      if (_controller.text.trim().toLowerCase() ==
          widget.words[currentIndex]['original']) {
        setState(() {
          feedback = 'Correct!';
          currentIndex = (currentIndex + 1);
          _controller.clear();
        });
      } else {
        setState(() {
          feedback = 'Try again!';
        });
      }
    } else {
      if (_controller.text.trim().toLowerCase() ==
          widget.words[currentIndex]['original']) {
        setState(() {
          feedback = 'Correct!';
          _controller.clear();
        });
      } else {
        setState(() {
          feedback = 'Try again!';
        });
      }
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
                  easy: PuzzleScreen(
                    words: DbData.easy,
                    level: 'easy',
                  ),
                  medium: PuzzleScreen(
                    words: DbData.medium,
                    level: 'medium',
                  ),
                  hard: PuzzleScreen(
                    words: DbData.hard,
                    level: 'hard',
                  )),
            ));
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => LevelScreen(
                    easy: PuzzleScreen(
                      level: 'easy',
                      words: DbData.easy,
                    ),
                    medium: PuzzleScreen(
                      level: 'medium',
                      words: DbData.medium,
                    ),
                    hard: PuzzleScreen(
                      level: 'hard',
                      words: DbData.hard,
                    )),
              ));
            },
            icon: Icon(
              Icons.arrow_back,
              color: ColorTheme.maincolor,
            ),
          ),
          centerTitle: true,
          title: Text(
            "WELCOME TO WORD",
            style: GlobalTextStyles.secondTittle,
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Text("${currentIndex + 1} / 10",
                      //     style: GlobalTextStyles.thirdTittle),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage(widget.words[currentIndex]['image'] ?? ""),
                      fit: BoxFit.contain,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                SizedBox(height: size.height * 0.04),
                Text("Clue"),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: Text(widget.words[currentIndex]['clue'].toString(),
                        style: GoogleFonts.poppins(
                            fontSize: 15, color: ColorTheme.maincolor)),
                  ),
                ),
                SizedBox(height: size.height * 0.04),
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.words[currentIndex]['shuffled']!
                        .split('')
                        .map((letter) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 3.0),
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        decoration: BoxDecoration(
                            color: ColorTheme.maincolor,
                            borderRadius: BorderRadius.circular(12)),
                        child: Text(
                          letter,
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(height: size.height * 0.01),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      size.width * 0.2, 0, size.width * 0.2, 0),
                  child: TextField(
                    controller: _controller,
                    style: TextStyle(color: ColorTheme.maincolor),
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                SizedBox(
                  child: ElevatedButton(
                      onPressed: () {
                        if (currentIndex == 9) {
                          checkAnswer();
                          if (feedback == 'Correct!') {
                            Timer(Duration(seconds: 5), () {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) => ScoreScreen(
                                            name: LevelScreen(
                                                easy: PuzzleScreen(
                                                  words: DbData.easy,
                                                  level: 'easy',
                                                ),
                                                medium: PuzzleScreen(
                                                  words: DbData.medium,
                                                  level: 'medium',
                                                ),
                                                hard: PuzzleScreen(
                                                  words: DbData.hard,
                                                  level: 'hard',
                                                )),
                                          )));
                            });
                          }
                        } else {
                          checkAnswer();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorTheme.maincolor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: Text("Check", style: GlobalTextStyles.buttonText)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  feedback,
                  style: TextStyle(
                      fontSize: 24,
                      color:
                          feedback == 'Correct!' ? Colors.green : Colors.red),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
