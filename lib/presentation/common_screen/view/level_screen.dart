import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/global_text_style.dart';
import '../../game_screen/view/game_screen.dart';

class LevelScreen extends StatelessWidget {
  final Widget easy;
  final Widget medium;
  final Widget hard;
  LevelScreen({required this.easy, required this.medium, required this.hard});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => GameScreen()));
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => GameScreen()));
              },
              icon: Icon(
                Icons.arrow_back,
                color: ColorTheme.maincolor,
              )),
          title:
          Text("CHOOSE YOUR LEVEL", style: GlobalTextStyles.secondTittle),
          centerTitle: true,
        ),
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.only(top: size.height * 0.08),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    height: size.height * .15,
                    width: size.width * .750,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => easy));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorTheme.maincolor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        child: Text(
                          "EASY",
                          style: GlobalTextStyles.subTitle4,
                        ))),
                SizedBox(
                  height: size.height * .1,
                ),
                Container(
                    height: size.height * .15,
                    width: size.width * .750,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => medium));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorTheme.maincolor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        child: Text(
                          "MEDIUM",
                          style: GlobalTextStyles.subTitle4,
                        ))),
                SizedBox(
                  height: size.height * .1,
                ),
                Container(
                    height: size.height * .15,
                    width: size.width * .750,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => hard));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorTheme.maincolor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        child: Text(
                          "EXPERT",
                          style: GlobalTextStyles.subTitle4,
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}