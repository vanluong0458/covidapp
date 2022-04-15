import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:covid_app/data/list_data.dart';
import 'package:flutter/material.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({ Key? key }) : super(key: key);

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  double screenWidth = 0;
  double screenHeight = 0;
  final Color mainColor = const Color(0xff181c27);
  final Color inactiveColor = const Color(0xff5d6169);

  @override
  void initState() {
    super.initState();
    setupPlaylist();
  }

  void setupPlaylist() async {
    await audioPlayer.open(Playlist(
      audios: audioList),
      autoStart: false,
      loopMode: LoopMode.playlist
    );
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: mainColor,
      body: audioPlayer.builderRealtimePlayingInfos(builder: (context, realtimePlayingInfos) {
        if(realtimePlayingInfos != null) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              playlistImage(),
              SizedBox(height: screenHeight * 0.02),
              playlistTitle(),
              SizedBox(height: screenHeight * 0.02),
              playButton(),
              SizedBox(height: screenHeight * 0.02),
              playlist(realtimePlayingInfos),
              bottomPlayContainer(realtimePlayingInfos)
            ],
          );
        } else {
          return Column();
        }
      }),
    );
  }

  Widget bottomPlayContainer(RealtimePlayingInfos realtimePlayingInfos) {
    return Container(
      height: screenHeight * 0.12,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Row(
          children: [
            SizedBox(
              height: screenHeight * 0.08,
              width: screenWidth * 0.15,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  realtimePlayingInfos.current!.audio.audio.metas.image!.path,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: screenWidth * 0.03),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    realtimePlayingInfos.current!.audio.audio.metas.title ?? '',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: mainColor,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.005),
                  Text(
                    realtimePlayingInfos.current!.audio.audio.metas.artist ?? '',
                    style: TextStyle(
                      color: mainColor,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: screenWidth * 0.03),
            IconButton(
              onPressed: () => audioPlayer.playOrPause(),
              icon: Icon(realtimePlayingInfos.isPlaying ? Icons.pause_circle_filled_rounded : Icons.play_circle_fill_rounded),
              iconSize: screenHeight * 0.07,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              color: mainColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget playlist(RealtimePlayingInfos realtimePlayingInfos) {
    return Container(
      height: screenHeight * 0.35,
      alignment: Alignment.bottomLeft,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return playlistItem(index);
        },
        shrinkWrap: true,
        itemCount: audioList.length,
      ),
    );
  }

  Widget playlistItem(int index) {
    return InkWell(
      onTap: () => audioPlayer.playlistPlayAtIndex(index),
      splashColor: Colors.transparent,
      highlightColor: mainColor,
      child: SizedBox(
        height: screenHeight * 0.07,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            children: [
              Text(
                '0${index + 1}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: screenWidth * 0.04),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      audioList[index].metas.title ?? '',
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    Text(
                      audioList[index].metas.artist ?? '',
                      style: TextStyle(
                        fontSize: 13,
                        color: inactiveColor,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.menu_rounded, color: inactiveColor,),
            ],
          ),
        ),
      ),
    );
  }

  Widget playButton() {
    return SizedBox(
      width: screenWidth * 0.25,
      child: TextButton(
        onPressed: () => audioPlayer.playlistPlayAtIndex(0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.play_circle_outline_rounded, color: mainColor,),
            const SizedBox(width: 5),
            Text(
              'Play',
              style: TextStyle(color: mainColor),
            )
          ],
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
        ),
      ),
    );
  }

  Widget playlistImage() {
    return SizedBox(
      height: screenHeight * 0.25,
      width: screenWidth * 0.5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image.asset('assets/images/covidnhanhdidi.png', fit: BoxFit.cover,),
      ),
    );
  }

  Widget playlistTitle() {
    return const Text(
      'Album Chiến Thắng COVID',
      style: TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}