import 'package:flutter/material.dart';
import 'package:game_app/core/constants/colors.dart';
import 'package:game_app/core/constants/global_text_style.dart';
import 'package:game_app/presentation/spell_checker/controller/spell_checker_controller.dart';
import 'package:provider/provider.dart';

class SpellChecker extends StatefulWidget {
  @override
  State<SpellChecker> createState() => _SpellCheckerState();
}

class _SpellCheckerState extends State<SpellChecker> {
  TextEditingController inputcontroller = TextEditingController();
  TextEditingController correctedcontroller = TextEditingController();

  @override
  void dispose() {
    inputcontroller.dispose();
    correctedcontroller.dispose();
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
        title: Text("SPELL CHECKER", style: GlobalTextStyles.mainTittle),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(top: size * 20),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size * 30, left: size * 20, right: size * 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Enter Your Text',
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
                        inputcontroller.clear();
                      });
                    },
                  )
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.all(size * 20),
                child: TextFormField(
                  controller: inputcontroller,
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
                Provider.of<SpellCheckerController>(context, listen: false)
                    .onSpellChecker(inputcontroller.text, context);
              },
              child: Text("SEND", style: GlobalTextStyles.buttonText),
            ),
            Padding(
              padding: EdgeInsets.only(top: size * 40, left: size * 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Corrected word',
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
                child: Consumer<SpellCheckerController>(
                    builder: (context, controller, child) {
                  correctedcontroller.text = controller.correctedtext;
                  return TextFormField(
                    controller: correctedcontroller,
                    maxLines: 6,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: ColorTheme.maincolor),
                        hintText: controller.correctedtext.isEmpty
                            ? 'Check'
                            : controller.correctedtext,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(size * 10),
                            borderSide: BorderSide(
                                color: ColorTheme.maincolor, width: size * 5))),
                  );
                }))
          ],
        ),
      ),
    );
  }
}
