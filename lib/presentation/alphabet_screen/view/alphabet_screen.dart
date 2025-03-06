import 'package:flutter/material.dart';
import 'package:game_app/core/constants/global_text_style.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/colors.dart';

class AlphabetScreen extends StatelessWidget {
  final List<String> capitalAlphabets = List.generate(
      26, (index) => String.fromCharCode('A'.codeUnitAt(0) + index));
  final List<String> smallAlphabets = List.generate(
      26, (index) => String.fromCharCode('a'.codeUnitAt(0) + index));

  @override
  Widget build(BuildContext context) {
    double size = constantsize(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: BackButton(color: ColorTheme.maincolor),
          backgroundColor: Colors.transparent,
          title: Text("ALPHABETS", style: GlobalTextStyles.mainTittle),
        ),
        body: CustomScrollView(slivers: [
          SliverPadding(
            padding: EdgeInsets.only(top: size * 50),
            sliver: SliverList(
                delegate: SliverChildListDelegate([
              Text("CAPITAL LETTERS",
                  textAlign: TextAlign.center,
                  style: GlobalTextStyles.mainTittle2)
            ])),
          ),
          SliverPadding(
              padding: EdgeInsets.all(size * 20),
              sliver: SliverList(
                  delegate: SliverChildListDelegate([
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: size * 8,
                  runSpacing: size * 5,
                  children: capitalAlphabets.map((letter) {
                    return Padding(
                      padding:
                          EdgeInsets.only(left: size * 10, right: size * 10),
                      child: Text(letter,
                          style: GoogleFonts.peddana(
                              decoration: TextDecoration.none,
                              fontSize: size * 38,
                              color: ColorTheme.maincolor,
                              fontWeight: FontWeight.w400)),
                    );
                  }).toList(),
                ),
              ]))),
          SliverPadding(
            padding: EdgeInsets.only(top: size * 50),
            sliver: SliverList(
                delegate: SliverChildListDelegate([
              Text("SMALL LETTERS",
                  textAlign: TextAlign.center,
                  style: GlobalTextStyles.mainTittle2)
            ])),
          ),
          SliverPadding(
              padding: EdgeInsets.all(size * 10),
              sliver: SliverList(
                  delegate: SliverChildListDelegate([
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: size * 8,
                  runSpacing: size * 5,
                  children: smallAlphabets.map((letter) {
                    return Padding(
                      padding:
                          EdgeInsets.only(left: size * 10, right: size * 10),
                      child: Text(letter,
                          style: GoogleFonts.peddana(
                              decoration: TextDecoration.none,
                              fontSize: size * 40,
                              color: ColorTheme.maincolor,
                              fontWeight: FontWeight.w400)),
                    );
                  }).toList(),
                ),
              ]))),
        ]));
  }
}
