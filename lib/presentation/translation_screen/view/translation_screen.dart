import 'package:flutter/material.dart';
import 'package:game_app/core/constants/colors.dart';
import 'package:game_app/core/constants/global_text_style.dart';
import 'package:game_app/presentation/translation_screen/controller/transilation_screen_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TranslationScreen extends StatefulWidget {
  @override
  State<TranslationScreen> createState() => _TranslationScreenState();
}

class _TranslationScreenState extends State<TranslationScreen> {
  TextEditingController tcontroller = TextEditingController();
  TextEditingController translatedController = TextEditingController();

  @override
  void dispose() {
    tcontroller.dispose();
    translatedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double size = constantsize(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: BackButton(color: ColorTheme.maincolor),
        backgroundColor: Colors.transparent,
        title: Text("TRANSLATION", style: GlobalTextStyles.mainTittle),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(top: size * 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: size * 35,
                    width: size * 120,
                    decoration: BoxDecoration(
                      color: ColorTheme.white,
                      borderRadius: BorderRadius.circular(size * 20),
                      border: Border.all(
                        width: size * 2,
                        color: ColorTheme.maincolor,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "മലയാളം",
                          style: GoogleFonts.roboto(
                              decoration: TextDecoration.none,
                              fontSize: size * 15,
                              color: ColorTheme.maincolor,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size * 10, right: size * 10),
                    child: Icon(
                      Icons.arrow_right_alt,
                      color: ColorTheme.maincolor,
                      size: size * 25,
                    ),
                  ),
                  Container(
                    height: size * 35,
                    width: size * 120,
                    decoration: BoxDecoration(
                      color: ColorTheme.white,
                      borderRadius: BorderRadius.circular(size * 20),
                      border: Border.all(
                        width: size * 2,
                        color: ColorTheme.maincolor,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "ENGLISH",
                          style: GoogleFonts.roboto(
                              decoration: TextDecoration.none,
                              fontSize: size * 15,
                              color: ColorTheme.maincolor,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size * 30, left: size * 20, right: size * 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'മലയാളം',
                    style: TextStyle(
                        fontSize: size * 18,
                        color: ColorTheme.maincolor,
                        fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    child: Icon(
                      Icons.cancel_outlined,
                      color: ColorTheme.maincolor,
                    ),
                    onTap: () {
                      setState(() {
                        tcontroller.clear();
                      });
                    },
                  )
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.all(size * 20),
                child: TextFormField(
                  controller: tcontroller,
                  maxLines: 6,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(color: ColorTheme.maincolor),
                      hintText: ' Enter your text',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(size * 10),
                          borderSide: BorderSide(
                              color: ColorTheme.maincolor, width: size * 5))),
                )),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorTheme.maincolor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(size * 7))),
              onPressed: () {
                Provider.of<TransilationController>(context, listen: false)
                    .onTransilation(
                  tcontroller.text,
                  context,
                );
              },
              child: Text("Translate", style: GlobalTextStyles.buttonText),
            ),
            Padding(
              padding: EdgeInsets.only(top: size * 40, left: size * 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'ENGLISH',
                    style: TextStyle(
                        fontSize: size * 18,
                        color: ColorTheme.maincolor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(size * 20),
              child: Consumer<TransilationController>(
                builder: (context, controller, child) {
                  translatedController.text = controller.translatedText;
                  return TextFormField(
                    controller: translatedController,
                    maxLines: 6,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: ColorTheme.maincolor),
                      hintText: controller.translatedText.isEmpty
                          ? ' Translation'
                          : controller.translatedText,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(size * 10),
                          borderSide: BorderSide(
                              color: ColorTheme.maincolor, width: size * 5)),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
