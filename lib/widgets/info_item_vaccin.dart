import 'package:covid_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoVaccinItem extends StatelessWidget {
  final String icon;
  final String name;
  final String typevaccin;
  final String birthday;
  const InfoVaccinItem({
    Key? key, required this.icon, required this.name, required this.typevaccin, required this.birthday,
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
              height: 100,
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
                height: 120,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                width: MediaQuery.of(context).size.width - 140,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                    Text(
                      'Vaccin đã tiêm:\n'+typevaccin,
                      style: kTitleTextstyle.copyWith(
                        fontSize: 16,
                      ),
                      softWrap: false,
                    ),
                    Text(
                      'Sinh ngày: '+birthday,
                      style: kTitleTextstyle.copyWith(
                        fontSize: 16,
                      ),
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