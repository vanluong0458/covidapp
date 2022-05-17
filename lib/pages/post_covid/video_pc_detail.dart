import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoPCDetail extends StatefulWidget {
  final String title, sources;
  const VideoPCDetail({ Key? key, required this.title, required this.sources }) : super(key: key);

  @override
  State<VideoPCDetail> createState() => _VideoPCDetailState();
}

class _VideoPCDetailState extends State<VideoPCDetail> {
  late YoutubePlayerController youtubePlayerController;

  @override
  void initState() {
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: YoutubePlayerController.convertUrlToId(widget.sources)!,
      params: const YoutubePlayerParams(
        loop: false,
        color: 'transparent',
        desktopMode: true,
        strictRelatedVideos: true,
        showFullscreenButton: !kIsWeb
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              height: kIsWeb ? screenSize.height / 1.13 : screenSize.height,
              width: screenSize.width,
              child: YoutubePlayerControllerProvider(
                controller: youtubePlayerController,
                child: YoutubePlayerIFrame(
                  controller: youtubePlayerController,
                )
              ),
            )
          )
        ],
      ),
    );
  }
}