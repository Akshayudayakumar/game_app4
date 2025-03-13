import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';

class PopupDialog extends StatefulWidget {
  final int currentIndex;
  final bool isAutoNextEnabled;

  const PopupDialog({
    Key? key,
    required this.currentIndex,
    required this.isAutoNextEnabled,
  }) : super(key: key);

  @override
  _PopupDialogState createState() => _PopupDialogState();
}

class _PopupDialogState extends State<PopupDialog> {
  late FlutterTts flutterTts;
  late int currentIndex;
  late Timer? timer;
  late bool isAutoNextEnabled;

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
    currentIndex = widget.currentIndex;
    isAutoNextEnabled = widget.isAutoNextEnabled;

    //_speakDescription();
    if (isAutoNextEnabled) {
      timer = Timer.periodic(const Duration(seconds: 3), (Timer t) {
        //_nextItem();
      });
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  // Future<void> _speakDescription() async {
  //   final currentItem = widget.items[currentIndex];
  //   await flutterTts.setLanguage("EN-IN");
  //   await flutterTts.speak(currentItem.items[currentIndex]);
  //   await flutterTts.speak(currentItem.items[currentIndex]);
  // }

  void _previousItem() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
        //_speakDescription();
      }
    });
  }

  // void _nextItem() {
  //   setState(() {
  //     if (currentIndex < widget.items.length - 1) {
  //       currentIndex++;
  //       _speakDescription();
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    content: Container(
      padding: EdgeInsets.zero,
    margin: EdgeInsets.zero,
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height * 0.70,
    decoration: BoxDecoration(
    color: Colors.blueAccent,
    borderRadius: BorderRadius.circular(10)),
    child: Padding(
    padding: EdgeInsets.all(20),
    child: Column(
    children: [
    Text(
    'A',
    style:  GoogleFonts.roboto(
    fontWeight: FontWeight.bold,
    fontSize: 40,color: Colors.white
    ),
    textAlign: TextAlign.center,
    ),
    SizedBox(height: 10),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    ElevatedButton(
    onPressed: _previousItem,
    style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),backgroundColor: Colors.green),
    child:  Text('Prev',style: GoogleFonts.roboto(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w500),),
    ),
    ElevatedButton(
    onPressed: (){},
      style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),backgroundColor: Colors.green,),
    child: Text('Next',style: GoogleFonts.roboto(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w500),),
    ),
    ],
    ),
    ],
    ),
    ),
    ),
    );

     }
}