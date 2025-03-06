import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(home: ChatbotScreen(), debugShowCheckedModeBanner: false));
}

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(
                'ChatBot',
                style: GoogleFonts.robotoSlab(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  textStyle: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              centerTitle: true,
              elevation: 3,
              backgroundColor: Colors.blue.shade300,
              expandedHeight: 200,
              floating: false,
              pinned: true,
              flexibleSpace: Text(
                'SmartChat : Your Smart AI Companion',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(controller: controller,cursorColor: Colors.black54,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(hintText: 'Search Here ...',border:OutlineInputBorder(),
                      filled: true,fillColor: Colors.amber,
                      hoverColor: Colors.yellow),
                    ),
                  ),
                  IconButton(onPressed: (){},style: IconButton.styleFrom(backgroundColor: Colors.blue),
                      icon: Icon(Icons.send,color: Colors.white,))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
