import 'package:covid_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoDeclarationItem extends StatelessWidget {
  final String icon;
  final String name;
  final String dateF0;
  final String birthday;
  final String dateDeclaration;
  final String f0;
  const InfoDeclarationItem({
    Key? key, required this.icon, required this.name, required this.dateF0, required this.birthday, required this.dateDeclaration, required this.f0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 130,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              height: 110,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 30,
                    color: kShadowColor,
                  ),
                ],
              ),
              child: SvgPicture.asset(
                icon,
                alignment: Alignment.centerLeft,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              left: 70,
              child: Container(
                height: 130,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                width: MediaQuery.of(context).size.width - 130,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                    Text(
                      'Sinh ngày: '+birthday,
                      style: kTitleTextstyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Ngày khai báo: '+dateDeclaration,
                      style: kTitleTextstyle.copyWith(
                        fontSize: 16,
                      ),
                      softWrap: false,
                    ),
                    Text(
                      'Đã từng F0 chưa: '+f0,
                      style: kTitleTextstyle.copyWith(
                        fontSize: 16,
                      ),
                      softWrap: false,
                    ),
                    Text(
                      'Ngày bị F0: '+dateF0,
                      style: kTitleTextstyle.copyWith(
                        fontSize: 16,
                      ),
                      softWrap: false,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}