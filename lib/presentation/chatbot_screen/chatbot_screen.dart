import 'package:flutter/material.dart';
import 'package:game_app/core/utils/chatbot_utils.dart';
import 'package:game_app/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:intl/intl.dart';
import 'model/chatbotmodel.dart';


class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final TextEditingController controller = TextEditingController();
  final List<ChatbotModel> prompt = [];

  Future<void> sendMessage() async {
    final message = controller.text;
    if (message.isEmpty) return;

    // Update UI with user's message
    setState(() {
      controller.clear();
      prompt.add(
        ChatbotModel(isPrompt: true, message: message, time: DateTime.now()),
      );
    });

    // Send request to AI model
    final content = [Content.text(message)];
    final response = await GeminiUtils.model.generateContent(content);

    setState(() {
      prompt.add(
        ChatbotModel(
          isPrompt: false,
          message: response.text ?? "No response from AI.",
          time: DateTime.now(),
        ),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: ColorTheme.secondarycolor,
          body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled)
      =>
      [
        SliverAppBar(
          expandedHeight: 200,
          backgroundColor: Colors.transparent,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(centerTitle: true,
            title: Text("SmartChat",style: GoogleFonts.poppins(fontSize: 25,fontWeight: FontWeight.bold,color: ColorTheme.maincolor),),
            expandedTitleScale: 2,
            background: Center(
              child: Text('Your Smart AI Companion',textAlign: TextAlign.center,
                  style: GoogleFonts.oswald(fontSize: 24,fontWeight: FontWeight.bold,color: ColorTheme.maincolor)),
            )
          ),
        ),
      ]
      , body: Column(children: [
      Expanded(
      child: ListView.builder(
      padding: EdgeInsets.all(10),
      itemBuilder: (context, index) {
      final message = prompt[index];
      return UserPrompt(
      isPrompt: message.isPrompt,
      message: message.message,
      date: DateFormat('hh:mm a').format(message.time),
      );
      },
      itemCount: prompt.length,
      ),
      ),
      Padding(
      padding: EdgeInsets.all(10),
      child: Row(
      children: [
      Expanded(
      child: TextField(
      controller: controller,
      cursorColor: Colors.black54,
      decoration: InputDecoration(
      hintText: 'Type a message...',
      border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: Colors.blue.withValues(alpha: 0.3),
      ),
      ),
      ),
      SizedBox(width: 5),
      IconButton(
      onPressed: sendMessage,
      iconSize: 30,
      style: IconButton.styleFrom(
      backgroundColor: Colors.blue,
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      ),
      ),
      icon: Icon(Icons.send, color: Colors.white),
      ),
      ],
      ),
      ),
      ],),
          ),
      ),
    );
  }
}

class UserPrompt extends StatelessWidget {
  final bool isPrompt;
  final String message;
  final String date;

  const UserPrompt({Key? key, required this.isPrompt, required this.message, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: isPrompt ? Colors.blue.shade50 : ColorTheme.maincolor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message,
            style: GoogleFonts.roboto(
              fontWeight: isPrompt ? FontWeight.w500: FontWeight.normal,
              fontSize: 16,
              color: isPrompt ? Colors.black : Colors.white,
            ),
          ),
          SizedBox(height: 5),
          Text(
            date,
            style: GoogleFonts.roboto(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: isPrompt ? Colors.black54 : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
