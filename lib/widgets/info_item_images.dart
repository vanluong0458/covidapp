import 'package:covid_app/constant.dart';
import 'package:covid_app/data/list_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoItemImages extends StatelessWidget {
  final String title;
  final List<ListDataInfor> listDataInfors;
  const InfoItemImages({
    Key? key, required this.title, required this.listDataInfors, 
  }) : super(key: key);

  _builCard(int index) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: kShadowColor,
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(1, 1),
          ),
        ],
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SvgPicture.asset(
            listDataInfors[index].img,
            width: 100,
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              listDataInfors[index].description,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      child: Container(
        height: 230,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: kShadowColor.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(2, 2),
            ),
          ],
          color: kBackgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 12),
              child: Text(title,
                  style: const TextStyle(
                    fontSize: 16,
                    color: kTitleTextColor,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listDataInfors.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: index == listDataInfors.length - 1
                        ? const EdgeInsets.all(12)
                        : const EdgeInsets.fromLTRB(12, 12, 0, 12),
                    child: _builCard(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}