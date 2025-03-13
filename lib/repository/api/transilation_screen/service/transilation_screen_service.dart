import 'dart:developer';

import 'package:game_app/repository/helper/api_helper.dart';

class TransilationService {
  static Future<dynamic> postTransilationData(Map<String, dynamic> data) async {
    try {
      var decodedData =
          await ApiHelper.postData(endPoint: "translate/", body: data);
      print(decodedData.toString());
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }
}
