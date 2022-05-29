import 'package:covid_app/constant.dart';
import 'package:covid_app/data/list_data.dart';
import 'package:covid_app/pages/post_covid/video_pc_detail.dart';
import 'package:flutter/material.dart';

class VideoPostCovid extends StatefulWidget {
  const VideoPostCovid({ Key? key }) : super(key: key);

  @override
  State<VideoPostCovid> createState() => _VideoPostCovidState();
}

class _VideoPostCovidState extends State<VideoPostCovid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Video Post Covid")),
      body: ListView(
        children: videoList.map((e) => GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => VideoPCDetail(
              sources: e['sources'] ?? '',
              title: e['title'] ?? '',
            )));
          },
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
                    child: Image.network(e['thumb'] ?? '')
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    e['title'] ?? '',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          e['subtitle'] ?? '',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )).toList(),
      ),
    );
  }
}