import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:game_app/core/utils/app_utils.dart';
import 'package:game_app/repository/api/spell_checker_service/service/spell_checker_service.dart';

class SpellCheckerController extends ChangeNotifier {
  String correctedtext = "";

  Future onSpellChecker(String user_input, BuildContext context) async {
    var data = {"user_input": user_input};
    try {
      var value = await SpellCheckerService.postSpellCheckerData(data);
      log("SpellCheckerController -> status -> ${value["status"]}");
      if (value["status"] == 1) {
        log("${value["corrected_text"]}");
        correctedtext = value["corrected_text"];
        notifyListeners();
        AppUtils.oneTimeSnackBar("Text Posted Successfully", context: context);
      } else {
        AppUtils.oneTimeSnackBar("Failed", context: context);
      }
    } catch (e) {
      log("Error: $e");
      AppUtils.oneTimeSnackBar("Failed to load Spellchecker", context: context);
    }
  }
}
