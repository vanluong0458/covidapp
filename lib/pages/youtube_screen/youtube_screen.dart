
import 'package:covid_app/constant.dart';
import 'package:covid_app/pages/youtube_screen/models/video_model.dart';
import 'package:covid_app/pages/youtube_screen/models/youtube_model.dart';
import 'package:covid_app/pages/youtube_screen/video_screen.dart';
import 'package:covid_app/services/api_youtube_servives.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class YouTubeScreen extends StatefulWidget {
  const YouTubeScreen({ Key? key }) : super(key: key);

  @override
  State<YouTubeScreen> createState() => _YouTubeScreenState();
}

class _YouTubeScreenState extends State<YouTubeScreen> {
  Channel? _channel;
  bool _isLoading = false;
  late GlobalKey<RefreshIndicatorState> _refreshKey;
  @override
  void initState() {
    super.initState();
    _refreshKey = GlobalKey<RefreshIndicatorState>();
    _initChannel();
  }

  _initChannel() async {
    Channel channel = await APIYoutubeServices.instance
        .fetchChannel(channelId: 'UCabsTV34JwALXKGMqHpvUiA');
    setState(() {
      _channel = channel;
    });
  }

  _loadMoreVideos() async {
    _isLoading = true;
    List<Video> moreVideos = await APIYoutubeServices.instance
        .fetchVideosFromPlaylist(playlistId: _channel!.uploadPlaylistId);
    List<Video> allVideos = _channel!.videos..addAll(moreVideos);
    setState(() {
      _channel!.videos = allVideos;
    });
    _isLoading = false;
  }

  _buildVideo(Video video) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => VideoScreen(
            id: video.id,
            description: video.description,
            title: video.title,
            publishedAt: video.publishedAt,
            profilePictureUrl: _channel!.profilePictureUrl,
          ),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
        child: Card(
          elevation: 5,
          shadowColor: kShadowColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  width: double.infinity,
                  height: 190,
                  child: FadeInImage.assetNetwork(
                    image: video.title != "Private video"
                        ? video.thumbnailUrl
                        : 'https://i.ytimg.com/vi/2UlFWK1pw9E/hqdefault.jpg',
                    placeholder: "assets/icons/loading.gif",
                    fit: BoxFit.cover,
                  )),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: kShadowColor.withOpacity(0.3),
                          radius: 20.0,
                          backgroundImage:
                              NetworkImage(_channel!.profilePictureUrl),
                        ),
                        const SizedBox(width: 7),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                video.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 2, bottom: 5),
                                child: Row(
                                  children: [
                                    Text(
                                      _channel!.title,
                                      style: kSubTextStyle,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Text('•', style: kTitleTextstyle),
                                    ),
                                    Expanded(
                                      child: Text(
                                        DateFormat("HH:mm - dd/MM/yyyy").format(
                                            DateTime.parse(video.publishedAt)),
                                        style: kSubTextStyle,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Text(
                        " " + video.description,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bản tin Covid-19'),
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      ),
      body: _channel != null
          ? NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollDetails) {
                if (!_isLoading &&
                    _channel!.videos.length != int.parse(_channel!.videoCount) &&
                    scrollDetails.metrics.pixels ==
                        scrollDetails.metrics.maxScrollExtent) {
                  _loadMoreVideos();
                }

                return false;
              },
              child: RefreshIndicator(
                key: _refreshKey,
                onRefresh: () => _initChannel(),
                child: SafeArea(
                  child: ListView.builder(
                    itemCount: 1 + _channel!.videos.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return Container();
                      }
                      Video video = _channel!.videos[index - 1];
                      return _buildVideo(video);
                    },
                  ),
                ),
              ),
            )
          : Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor,
                ),
              ),
            ),
    );
  }
}