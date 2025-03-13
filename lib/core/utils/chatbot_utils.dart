import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiUtils{
  static final apiKey = "AIzaSyA--QtNIGfmRHLHWKiDQ1TLvNswuHLb_Sg";
  static final model = GenerativeModel(model: "gemini-2.0-flash", apiKey: apiKey);
}