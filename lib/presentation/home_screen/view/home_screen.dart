import 'dart:io';
import 'package:flutter/material.dart';
import 'package:game_app/core/constants/colors.dart';
import 'package:game_app/core/constants/global_text_style.dart';
import 'package:game_app/presentation/alphabet_screen/view/alphabet_screen.dart';
import 'package:game_app/presentation/chatbot_screen/chatbot_screen.dart';
import 'package:game_app/presentation/pronounciation_screen/pronounciation_screen.dart';
import 'package:game_app/presentation/sentense_screen/view/sentence_screen.dart';
import 'package:game_app/presentation/spell_checker/view/spell_checker.dart';
import 'package:path_provider/path_provider.dart';
import '../../game_screen/view/game_screen.dart';
import '../../registration_page/view/registration_screen.dart';
import '../../translation_screen/view/translation_screen.dart';
import '../../video_screen/view/video_screen.dart';
import '../../word_screen/view/word_screen.dart';

void main(){
  runApp(MaterialApp(home: HomeScreen(),));
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _name = '';

  @override
  void initState() {
    super.initState();
    _loadName();
  }

  Future<String> _readName() async {
    try {
      final file = await _getLocalFile();
      String name = await file.readAsString();
      return name;
    } catch (e) {
      return '';
    }
  }

  Future<File> _getLocalFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/name.txt');
  }

  Future<void> _loadName() async {
    String name = await _readName();
    setState(() {
      _name = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    var names = [
      'START WITH ALPHABETS',
      'LEARN WITH WORDS',
      'SPEAK WITH WORDS',
      'LEARN WITH GAMES',
      'LEARN WITH SENTENCES',
      'SPELL CHECKER',
      'LEARN WITH VIDEOS',
      'TRANSLATION',
      'AI CHATBOT'
    ];
    var screen = [
      AlphabetScreen(),
      WordScreen(),
      PronounciationScreen(),
      GameScreen(),
      SentenceScreen(),
      SpellChecker(),
      VideosScreen(),
      TranslationScreen(),
      ChatBotScreen()
    ];
    double size = constantsize(context);
    return Scaffold(
        backgroundColor: ColorTheme.secondarycolor,
        body: CustomScrollView(slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            SizedBox(height: size * 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: size * 45),
                      child: Container(
                        width: size * 210,
                        alignment: Alignment.centerLeft,
                        child: Text("Hi, 👋 $_name",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GlobalTextStyles.subTitle3),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: size * 45),
                        child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text("Let’s start learning!",
                                style: GlobalTextStyles.subTitle1))),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: size * 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegistrationScreen()),
                          (route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: ColorTheme.maincolor,
                      backgroundColor: Colors.white, // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      "LogOut",
                      style: TextStyle(color: ColorTheme.maincolor),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: size * 65)
          ])),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding:
                      EdgeInsets.fromLTRB(size * 20, size * 20, size * 20, 0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => screen[index],
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: size * 10,
                        bottom: size * 10,
                        left: size * 25,
                        right: size * 25,
                      ),
                      child: Container(
                        height: size * 83,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ColorTheme.maincolor,
                            width: 5, // Adjust the width as needed
                          ),
                          color: ColorTheme.white,
                          borderRadius: BorderRadius.circular(size * 5),
                        ),
                        child: Center(
                          child: Text(
                            names[index],
                            style: GlobalTextStyles.thirdTittle,
                            // style: GoogleFonts.passionOne(
                            //   decoration: TextDecoration.none,
                            //   fontSize: size * 30,
                            //   color: ColorTheme.maincolor,
                            // ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              childCount: 9,
            ),
          ),
        ]));
  }
}
