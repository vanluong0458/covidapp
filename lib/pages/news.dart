import 'package:covid_app/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webfeed/webfeed.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({ Key? key }) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  // ignore: constant_identifier_names
  static const String FEED_URL = 'https://thanhnien.vn/rss/ban-doc/am-ap-mua-gian-cach-305.rss';

  RssFeed? _feed;
  late String _title;
  static const String loadingFeedMsg = 'Đang tải trang...';
  static const String feedLoadErrorMsg = 'Không thể tải trang';
  static const String feedOpenErrorMsg = 'Không thể mở liên kết';
  late GlobalKey<RefreshIndicatorState> _refreshKey;

  updateTitle(title) {
    setState(() {
      _title = title;
    });
  }

  updateFeed(feed) {
    setState(() {
      _feed = feed;
    });
  }

  Future<void> openFeed(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: false,
      );
      return;
    }
    updateTitle(feedOpenErrorMsg);
  }

  Future<RssFeed?> loadFeed() async {
    try {
      final client = http.Client();
      final response = await client.get(Uri.parse(FEED_URL));

      return RssFeed.parse(response.body);
    // ignore: empty_catches
    } catch (e) {}
    return null;
  }

  load() async {
    updateTitle(loadingFeedMsg);
    loadFeed().then((result) {
      if (null == result || result.toString().isEmpty) {
        updateTitle(feedLoadErrorMsg);
        // ignore: avoid_print
        print(result!.description);
        return;
      }
      updateFeed(result);
      updateTitle(_feed?.title);
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshKey = GlobalKey<RefreshIndicatorState>();
    load();
  }

  title(title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      maxLines: 2,
      overflow: TextOverflow.clip,
    );
  }

  // dateTime(pubDate) {
  //   return Text(
  //     DateFormat("HH:mm - dd/MM/yyyy").format((pubDate)),
  //     style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
  //     overflow: TextOverflow.ellipsis,
  //   );
  // }

  description(description) {
    return Text(
      description,
      style: const TextStyle(
          fontSize: 14.5, fontWeight: FontWeight.w500, color: kTitleTextColor),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }

  thumbnail(imageUrl) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: 110,
        width: 150,
        alignment: Alignment.center,
        fit: BoxFit.fill,
      ),
    );
  }

  listNews() {
    return ListView.builder(
      itemCount: _feed?.items!.length,
      itemBuilder: (BuildContext context, int index) {
        final item = _feed?.items![index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Card(
            elevation: 5,
            shadowColor: kShadowColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: InkWell(
              onTap: () => openFeed(item?.link ?? ''),
              child: Row(
                children: [
                  thumbnail(item!.content!.images.isNotEmpty
                      ? item.content!.images.first
                      : 'https://www.viet247.net/images/noimage_food_viet247.jpg'),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          title(item.title),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(vertical: 4),
                          //   child: dateTime(item.pubDate),
                          // ),
                          description(item.description),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  isFeedEmpty() {
    return null == _feed || null == _feed?.items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        backgroundColor: Colors.green,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      ),
      body: isFeedEmpty()
        ? const Center(
            child: Text('bug rồi')//CircularProgressIndicator(),
          )
        : RefreshIndicator(
            key: _refreshKey,
            child: listNews(),
            onRefresh: () => load(),
          ),
    );
  }
}