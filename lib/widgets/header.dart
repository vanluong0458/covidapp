import 'package:covid_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHeader extends StatelessWidget {
  final String image;
  final String textTop;
  final String textMiddle;
  final String textBottom;
  
  const MyHeader({
    Key? key, required this.image, required this.textTop, required this.textBottom, required this.textMiddle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: const EdgeInsets.only(left: 40, top: 20, right: 20),
        height: 350,
        width: double.infinity, // Chiếm toàn bộ chiều ngang màn hình
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromRGBO(27, 94, 32, 1),
              Color.fromRGBO(76, 175, 80, 1),
              Color.fromRGBO(102, 187, 106, 1),
            ]
          ),
          image: DecorationImage(image: AssetImage("assets/images/virus.png"))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20), // Khoảng cách so với phần tử bên trên
            Expanded(
              child: Stack(
                children: [
                  SvgPicture.asset(
                    image,
                    width: 230,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                  Positioned(
                    top: 20,
                    left: 150,
                    child: Text(
                      '$textTop\n$textMiddle\n$textBottom',
                      style: kHeadingTextStyle.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Container(), // ???
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(size.width/2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
    //throw UnimplementedError();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    //throw UnimplementedError();
    return false;
  }
}