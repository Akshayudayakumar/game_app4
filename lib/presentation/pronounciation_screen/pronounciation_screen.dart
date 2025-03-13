import 'package:flutter/material.dart';
import 'package:game_app/presentation/pronounciation_screen/constants/description.dart';
import 'package:game_app/presentation/pronounciation_screen/controller/pron_controller.dart';
import 'package:game_app/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class PronounciationScreen extends StatefulWidget {
  @override
  State<PronounciationScreen> createState() => _PronounciationScreenState();
}

class _PronounciationScreenState extends State<PronounciationScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: ColorTheme.primarycolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Speak ABC',
          style:GoogleFonts.poppins(
              fontSize: 35, fontWeight: FontWeight.bold, color: ColorTheme.maincolor)
        ),
        centerTitle: true,
        actions: [
          IconButton(
            iconSize: 35,
            onPressed: () {
              context.read<A2ZProvider>().isToggled();
            },

            icon: Icon(Icons.color_lens_sharp,color: ColorTheme.maincolor)
          ),
        ],
      ),
      body: GridView.builder(
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        itemCount: 26,
        itemBuilder: (context, index) {
          String letter = String.fromCharCode(65 + index);
          String word = context.read<A2ZProvider>().wordExamples[letter] ?? '';

          return GestureDetector(
            onTap: () {
              context.read<A2ZProvider>().speak(letter);
            },
            child: Card(
              elevation: 3,
              color: context.watch<A2ZProvider>().generateRandomColor(),
              child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                          letter,
                          style: GoogleFonts.italiana(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                                              ),
                        ),
                      ),
                  Expanded(
                    child: Image.asset(
                      'assets/images/alphabets/${letter.toLowerCase()}.png',
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(alignment: Alignment.center,
                    child: Text(
                      word,
                      style: GoogleFonts.roboto(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                      Expanded(child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text('${Description.getDescription(letter)}',style: GoogleFonts.roboto(fontSize: 15,color: Colors.white),),
                      ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
