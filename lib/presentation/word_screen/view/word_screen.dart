import 'package:flutter/material.dart';
import 'package:game_app/core/constants/colors.dart';
import 'package:game_app/core/constants/global_text_style.dart';

class WordScreen extends StatelessWidget {
  var images = [
    "assets/words/a.png",
    "assets/words/b.png",
    "assets/words/c.png",
    "assets/words/d.png",
    "assets/words/e.png",
    "assets/words/f.png",
    "assets/words/g.png",
    "assets/words/h.png",
    "assets/words/i.png",
    "assets/words/j.png",
    "assets/words/k.png",
    "assets/words/l.png",
    "assets/words/m.png",
    "assets/words/n.png",
    "assets/words/o.png",
    "assets/words/p.png",
    "assets/words/q.png",
    "assets/words/r.png",
    "assets/words/s.png",
    "assets/words/t.png",
    "assets/words/u.png",
    "assets/words/v.png",
    "assets/words/w.png",
    "assets/words/x.png",
    "assets/words/y.png",
    "assets/words/z.png"
  ];

  var names = [
    "Ambulance",
    "Ball",
    "Cat",
    "Doll",
    "Elephant",
    "Fish",
    "Giraffe",
    "Home",
    "Ice Cream",
    "Jack Fruit",
    "Kite",
    "Lion",
    "Monkey",
    "Nurse",
    "Orange",
    "Pen",
    "Queen",
    "Rat",
    "Sun",
    "Tree",
    "Umbrella",
    "Van",
    "Watermelon",
    "Xerus",
    "Yak",
    "Zebra"
  ];

  @override
  Widget build(BuildContext context) {
    double size = constantsize(context);
    return Scaffold(
      backgroundColor: ColorTheme.white,
      appBar: AppBar(
        leading: BackButton(color: ColorTheme.maincolor),
        centerTitle: true,
        backgroundColor: ColorTheme.white,
        title: Text("WORDS", style: GlobalTextStyles.mainTittle),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(size * 10, 50, size * 10, 0),
        child: GridView(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: size * 10,
            crossAxisSpacing: size * 10,
            childAspectRatio: 1 / 1.3,
          ),
          children: List.generate(
              names.length,
              (index) => Container(
                    child: Column(
                      children: [
                        Expanded(
                          child: Image(
                            image: AssetImage(images[index]),
                            fit: BoxFit.fill,
                          ),
                        ),
                        Expanded(
                          child: Text(names[index],
                              style: GlobalTextStyles.subTitle3),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size * 20),
                    ),
                  )),
        ),
      ),
    );
  }
}
