import 'dart:developer';
import 'package:game_app/repository/helper/api_helper.dart';

class SpellCheckerService {
  static Future<dynamic>  postSpellCheckerData(Map<String, String> data) async {
    try {
      var decodedData = await ApiHelper.postData(endPoint: "spellcheck/", body: data);
      return decodedData;
    } catch (e) {
      log("Error in SpellCheckerService: $e");
      throw Exception('Failed to load spell checker data');
    }
  }
}
