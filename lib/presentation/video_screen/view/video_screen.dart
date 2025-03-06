import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/global_text_style.dart';


class VideosScreen extends StatefulWidget {
  @override
  _VideosScreenState createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  final List<String> videoUrls = [
    'https://youtu.be/7HUW_aukApo?si=Y3hQA9Az44N_q_iD',
    'https://youtu.be/qD1pnquN_DM?si=hOsM4YjvF0cifdt7',
    'https://youtu.be/j1bIdWfeutI?si=1sVuS9LA1iPYrft6',
    'https://youtu.be/2i4CbCINjWA?si=TR2ixSM7kVQl2LLZ',
    'https://youtu.be/8irSFvoyLHQ?si=Udc0_Jn1GJL1mQkQ',
  ];

  List<YoutubePlayerController> _controllers = [];

  @override
  void initState() {
    super.initState();
    _controllers = videoUrls
        .map((videoUrl) {
      final videoId = YoutubePlayer.convertUrlToId(videoUrl);
      return YoutubePlayerController(
        initialVideoId: videoId ?? '', // Provide a default value
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      );
    })
        .toList();
  }

  @override
  void dispose() {
    _controllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: BackButton(color: ColorTheme.maincolor),
        title: Text('VIDEOS',style: GlobalTextStyles.mainTittle),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _controllers.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.only(top: 5,left: 10,right: 10),
              child: Container(
                height: 200,
                child: YoutubePlayer(
                  controller: _controllers[index],
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.red,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}