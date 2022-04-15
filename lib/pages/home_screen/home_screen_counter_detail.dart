import 'package:covid_app/constant.dart';
import 'package:flutter/material.dart';

class CounterDetail extends StatelessWidget {
  final int number;
  final Color color;
  final String title;
  final int subtitle;
  const CounterDetail({ Key? key, required this.number, required this.color, required this.title, required this.subtitle }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: kShadowColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                '$number'.replaceAllMapped(reg, (Match match) => '${match[1]}.'),
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ),
            Text(
              '+$subtitle'.replaceAllMapped(reg, (Match match) => '${match[1]}.'),
              style: kSubTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}