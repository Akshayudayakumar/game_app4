import 'package:flutter/material.dart';
import 'package:game_app/core/constants/colors.dart';
import 'package:game_app/core/constants/global_text_style.dart';

class ScoreScreen extends StatelessWidget {
  final Widget name;

  ScoreScreen({required this.name});

  @override
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: ColorTheme.maincolor,
      appBar:
          AppBar(backgroundColor: ColorTheme.maincolor, leading: Icon(null)),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * .1,
            ),
            Container(
              height: size.height * .35,
              width: size.width * .70,
              decoration: BoxDecoration(
                  color: ColorTheme.white,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * .027,
                  ),
                  Image.asset("assets/images/congrats.png"),
                ],
              ),
            ),
            SizedBox(height: size.height * .1),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => name));
              },
              child: Text(
                "Change Difficulty",
                style: GlobalTextStyles.subTitle2,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
