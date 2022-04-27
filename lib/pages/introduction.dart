import 'package:covid_app/bottombar/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Introduction extends StatefulWidget {
  const Introduction({ Key? key }) : super(key: key);

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget buildPage({
    required Color color,
    required String image,
    required String title,
    required String subtitle,
  }) => Container(
    color: color,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          image,
          fit: BoxFit.cover,
          width: 320,
          height: 320,
        ),
        const SizedBox(height: 64),
        Text(
          title,
          style: TextStyle(
            color: Colors.teal.shade700,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            subtitle,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        onPageChanged: (index) {
          setState(() => isLastPage = index == 3);
        },
        children: [
          buildPage(
            color: Colors.green.shade100,
            image: 'assets/introduction/news.svg',
            title: 'XIN CHÀO!',
            subtitle: 'Chào mừng bạn đến với RCOVI, nơi cập nhật các thông tin liên quan về Covid trên cả nước và quốc tế.'
          ),
          buildPage(
            color: Colors.green.shade100,
            image: 'assets/introduction/healthcare.svg',
            title: 'SỨC KHỎE',
            subtitle: 'Các triệu chứng, nguyên nhân, cách phòng bệnh và các phản hồi thắc mắc về Covid sẽ được cung cấp cho bạn.'
          ),
          buildPage(
            color: Colors.green.shade100,
            image: 'assets/introduction/news-anchor.svg',
            title: 'TIN TỨC',
            subtitle: 'Bạn có thể theo dõi các tin tức liên quan đến tình hình dịch bệnh được chúng tôi cập nhật hàng ngày.'
          ),
          buildPage(
            color: Colors.green.shade100,
            image: 'assets/introduction/listening.svg',
            title: 'GIẢI TRÍ',
            subtitle: 'Một danh sách các bài hát cổ vũ tinh thần người dân chống dịch, giúp bạn có có nhiều năng lượng hơn.'
          ),
        ],
      ),
      bottomSheet: isLastPage
      ? TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          primary: Colors.white,
          backgroundColor: Colors.teal.shade700,
          minimumSize: const Size.fromHeight(80),
        ),
        onPressed: () async {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const BottomBar()),
          );
        },
        child: const Text('Bắt đầu', style: TextStyle(fontSize: 24)),
      )
      : Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () => controller.jumpToPage(3),
              child: const Text('Skip'),
            ),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 4,
                effect: WormEffect(
                  spacing: 16,
                  dotColor: Colors.black26,
                  activeDotColor: Colors.teal.shade700,
                ),
                onDotClicked: (index) => controller.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                ),
              ),
            ),
            TextButton(
              onPressed: () => controller.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              ),
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}