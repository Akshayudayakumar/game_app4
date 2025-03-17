import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:game_app/config/app_config.dart';

class ApiHelper {

  // static String csrfToken = '';
  //
  // Future<void> fetchCsrfToken() async {
  //   final url = Uri.parse('https://df2c-111-92-45-244.ngrok-free.app/translate/');
  //   final response = await http.get(url);
  //
  //   if (response.statusCode == 200) {
  //     final jsonResponse = jsonDecode(response.body);
  //     csrfToken = jsonResponse['csrfToken'];
  //     print('CSRF Token: $csrfToken');
  //   } else {
  //     print('Failed to get CSRF token: ${response.statusCode}');
  //   }
  // }

  static postData({
    required String endPoint,
    Map<String, dynamic>? body,
  }) async {
    log("input $body");
    final url = Uri.parse(AppConfig.baseUrl + endPoint);
    log("$url -> url");
    try {
      var response = await http.post(url,
          body: body);
      log("Status code -> ${response.statusCode}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = response.body;
        var decodedData = jsonDecode(data);
        return decodedData;
      } else {
        log("Api Failed");
        var data = response.body;
        var decodedData = jsonDecode(data);
        return decodedData;
      }
    } catch (e) {
      log("$e");
    }
  }
}
