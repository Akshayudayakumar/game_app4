import 'package:flutter/material.dart';
import 'package:game_app/core/constants/colors.dart';
import 'package:game_app/core/constants/global_text_style.dart';
import 'package:game_app/presentation/home_screen/view/home_screen.dart';

class SentenceScreen extends StatelessWidget {
  var english = [
    "How are you?",
    "What's your name?",
    "Where are you from?",
    "How old are you?",
    "Can you help me?",
    "Nice to meet you.",
    "What do you do?",
    "How was your day?",
    "Where do you live?",
    "What's the weather like?",
    "How's it going?",
    "What time is it?",
    "Where is the nearest restaurant?",
    "Can you repeat that, please?",
    "I'm sorry, I don't understand.",
    "Please wait a moment.",
    "Excuse me, where is the restroom?",
    "Thank you for your help.",
    "Can I have a glass of water, please?",
    "I'm sorry for being late.",
    "Have a good day!",
    "How was your weekend?",
  ];

  var meaning = [
    "സുഖമാണോ?",
    "എന്താണ് നിങ്ങളുടെ പേര്?",
    "നീ എവിടെ നിന്ന് വരുന്നു?",
    "നിങ്ങൾക്ക് എത്രവയസ്സുണ്ട്?",
    "എന്നെ സഹായിക്കാമോ?",
    "നിന്നെ കാണാനായതിൽ സന്തോഷം.",
    "നീ എന്ത് ചെയ്യുന്നു?",
    "നിന്റെ ദിവസം എങ്ങനെയുണ്ടായിരുന്നു?",
    "നിങ്ങൾ എവിടെ താമസിക്കുന്നു?",
    "ഇന്നത്തെ കാലാവസ്ഥ എങ്ങനെയുണ്ട്?",
    "എങ്ങനെ പോകുന്നു?",
    "എത്രയാണ് സമയം?",
    "സമീപത്തെവിടെയാണ് റസ്റ്റോറന്റുള്ളത്?",
    "ദയവായി അത് ആവർത്തിക്കാമോ?",
    "ക്ഷമിക്കണം, എനിക്ക് മനസ്സിലാകുന്നില്ല.",
    "ദയവായി ഒരു നിമിഷം കാത്തിരിക്കൂ.",
    "ക്ഷമിക്കണം, വിശ്രമമുറി എവിടെയാണ്?",
    "നിന്റെ സഹായത്തിന് നന്ദി.",
    "എനിക്ക് ഒരു ഗ്ലാസ് വെള്ളം തരാമോ?",
    "വൈകിയതിൽ ക്ഷമിക്കണം.",
    "ഒരു നല്ല ദിനം ആശംസിക്കുന്നു!",
    "നിങ്ങളുടെ വാരാന്ത്യം എങ്ങനെയായിരുന്നു?",
  ];

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width / 20;
    return Scaffold(
      backgroundColor: ColorTheme.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ColorTheme.maincolor,
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        ),
        centerTitle: true,
        backgroundColor: ColorTheme.Transperance,
        title: Text("SENTENCES", style: GlobalTextStyles.mainTittle),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size * 1),
        child: ListView.builder(
          itemCount: english.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: size * .5),
              padding: EdgeInsets.all(size * 2),
              decoration: BoxDecoration(
                color: ColorTheme.secondarycolor,
                borderRadius: BorderRadius.circular(size * 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(english[index], style: GlobalTextStyles.subTitle3),
                  SizedBox(height: size),
                  Text(meaning[index], style: GlobalTextStyles.subTitle3),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
