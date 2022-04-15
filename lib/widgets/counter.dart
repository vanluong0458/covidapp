import 'package:covid_app/constant.dart';
import 'package:flutter/material.dart';


class Counter extends StatelessWidget {
  final int number;
  final Color color;
  final String title;
  final int subtitle;

  const Counter({
    Key? key,  required this.number,  required this.color,  required this.title, required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.3,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: kShadowColor,
            blurRadius: 5,
            offset: const Offset(1, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withOpacity(0.26),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              '$number'.replaceAllMapped(reg, (Match match) => '${match[1]}.'),
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 3.0),
            child: Text(
              "+$subtitle".replaceAllMapped(reg, (Match match) => '${match[1]}.'),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: kTextLightColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Text(
              title,
              style: kSubTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
