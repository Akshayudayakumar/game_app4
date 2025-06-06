import 'package:flutter/material.dart';
import 'package:game_app/presentation/pronounciation_screen/controller/pron_controller.dart';
import 'package:game_app/presentation/spell_checker/controller/spell_checker_controller.dart';
import 'package:game_app/presentation/splash_screen/view/splash_screen.dart';
import 'package:game_app/presentation/translation_screen/controller/transilation_screen_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TransilationController()),
        ChangeNotifierProvider(create: (context) => SpellCheckerController()),
        ChangeNotifierProvider(create: (context) => A2ZProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
