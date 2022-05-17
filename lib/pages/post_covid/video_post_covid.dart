import 'package:covid_app/constant.dart';
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

var videoList = [
  {
    "sources" : "https://www.youtube.com/watch?v=fMwx_0Mhaao",
    "subtitle" : "Theo trang tin của Bộ Y tế trích lời bác sĩ Nguyễn Văn Giang - Phó Trưởng khoa Hô hấp và Bệnh phổi, BVĐK Hà Đông, người bệnh cần biết một số điều cần thiết sau đây về hậu Covid-19 để tránh lo lắng thái quá.",
    "thumb" : "https://i.ytimg.com/vi/fMwx_0Mhaao/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLCgGsyp1HOoqO7ArGm7H0I83t9tWg",
    "title" : "6 điều cần biết về hậu Covid 19 để tránh lo lắng thái quá"
  },
  {
    "sources" : "https://www.youtube.com/watch?v=xUBK9aa5C5I",
    "subtitle" : "Với chiến lược tiêm vắc xin đồng loạt và rộng khắp, có thể nói là cuộc chiến chống COVID-19 của Việt Nam đã có nhiều tín hiệu khả quan. Tuy nhiên, khi mà dịch bệnh đi qua thì Việt Nam lại phải đối mặt với một vấn đề khác, đó là sức khỏe hậu COVID. Hiện nay, khi mà số ca mắc giảm thì lại là lúc mà số trường hợp mắc các triệu chứng hậu COVID tăng lên.",
    "thumb" : "https://i.ytimg.com/vi/xUBK9aa5C5I/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLAtSAMO534wqmuxJ1_VosxJb00kYA",
    "title" : "Sức khỏe hậu COVID-19 | VTV24"
  },
  {
    "sources" : "https://www.youtube.com/watch?v=fbycj-xuRGU",
    "subtitle" : "Trên thực tế trẻ mắc COVID-19 thường có triệu chứng nhẹ hoặc không có triệu chứng. Tuy nhiên, khi khỏi bệnh trẻ thường có một số tổn thương khác.",
    "thumb" : "https://i.ytimg.com/vi/fbycj-xuRGU/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLDvdhYOL99Qnft1_KpOywaXvY3oKQ",
    "title" : "Hậu COVID-19 ở trẻ em | VTV24"
  },
  {
    "sources" : "https://www.youtube.com/watch?v=0Yzw3eAj5gw",
    "subtitle" : "Sau mắc Covid-19, nếu có một trong 10 triệu chứng thường gặp ảnh hưởng sức khỏe, người mắc nên đi khám để được hỗ trợ y tế hoặc điều trị.",
    "thumb" : "https://i.ytimg.com/vi/0Yzw3eAj5gw/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLCeJ_D9vGPh8H6LoUrpP9zS6FcYQA",
    "title" : "10 triệu chứng thường gặp liên quan hậu Covid-19 nên được khám ngay"
  },
  {
    "sources" : "https://www.youtube.com/watch?v=UUrzouvy8Dk",
    "subtitle" : "Hậu Covid-19: Não bị ảnh hưởng thế nào? TS.BS Đinh Vinh Quang - Trưởng khoa Nội Thần Kinh - BV Nhân Dân 115 tư vấn.",
    "thumb" : "https://i.ytimg.com/vi/UUrzouvy8Dk/hqdefault.jpg?sqp=-oaymwEcCOADEI4CSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLAEzaTXbqxsgtAC6EBdS08E4nhSwA",
    "title" : "Hậu Covid-19: Não bị ảnh hưởng thế nào? | TS.BS Đinh Vinh Quang Giải Đáp"
  },
  {
    "sources" : "https://www.youtube.com/watch?v=wQwEkB3o3MI",
    "subtitle" : "Đau nhức hậu COVID-19 khiến người bệnh đối diện nhiều vấn đề về sức khỏe cho nên cần phải sinh hoạt, dinh dưỡng hợp lý để phục hồi dần các chức năng cơ thể. Vậy, làm sao để khắc phục tình trạng đau nhức hậu COVID-19? BS Trương Hữu Khanh sẽ giúp quý khán giả giải đáp thắc mắc trên.",
    "thumb" : "https://i.ytimg.com/vi/wQwEkB3o3MI/hqdefault.jpg?sqp=-oaymwEcCOADEI4CSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLBV7m9VrFdYUiYUS1yVmtc78PrDcg",
    "title" : "Đau nhức hậu COVID-19, cách nào khắc phục? | BS Trương Hữu Khanh"
  },
  {
    "sources" : "https://www.youtube.com/watch?v=2oYvjUekpWQ",
    "subtitle" : "4 Nhóm Thực Phẩm Bổ Phổi Hậu COVID-19, giúp cho phổi nhanh chóng phục hồi sau khi mắc COVID",
    "thumb" : "https://i.ytimg.com/vi/2oYvjUekpWQ/hqdefault.jpg?sqp=-oaymwEcCOADEI4CSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLDfdHxBJZZMpnNIWYONIqXC6fkMYw",
    "title" : "4 Nhóm Thực Phẩm Bổ Phổi Hậu COVID-19"
  },
  {
    "sources" : "https://www.youtube.com/watch?v=7h86m7xcBIY",
    "subtitle" : "Sau khi khỏi Covid-19, một số trường hợp có thể gặp các triệu chứng hậu Covid-19 kéo dài vài tuần đến vài tháng, trong đó khá phổ biến là các biểu hiện về hô hấp.",
    "thumb" : "https://i.ytimg.com/vi/7h86m7xcBIY/hqdefault.jpg?sqp=-oaymwEcCOADEI4CSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLCUWqUgRZSaVFNORC0JTyUfzx8nnw",
    "title" : "Khi nào nên đi khám hậu Covid-19?"
  },
  {
    "sources" : "https://www.youtube.com/watch?v=Yj9szBU2SkI",
    "subtitle" : "Theo các chuyên gia, đi khám đúng nơi, điều trị đúng bệnh và tuân thủ điều trị là vượt qua hậu Covid-19 nhanh chóng.",
    "thumb" : "https://i.ytimg.com/vi/Yj9szBU2SkI/hqdefault.jpg?sqp=-oaymwEcCOADEI4CSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLCUYfo9K_bbbWef6zhnd7Yp9vnbvQ",
    "title" : "Điều trị hậu Covid-19 có khó không?"
  },
  {
    "sources" : "https://www.youtube.com/watch?v=Nyp_NiJA9TE",
    "subtitle" : "Hệ thống hô hấp không thể hồi phúc về bình thường kèm theo đó là những nỗi ám ảnh.",
    "thumb" : "https://i.ytimg.com/vi/Nyp_NiJA9TE/hqdefault.jpg?sqp=-oaymwEcCOADEI4CSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLBvdu7bqubtKXySKylDobSBeGJ83Q",
    "title" : "Hậu mắc COVID-19 nhiều bệnh nhân gặp vấn đề sức khỏe và tâm lý | VTV24"
  },
];