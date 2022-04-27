import 'package:covid_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountryChartLoading extends StatelessWidget {
  final bool inputTextLoading;
  const CountryChartLoading({ Key? key, required this.inputTextLoading }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding:
              const EdgeInsets.only(top: 25, left: 15, right: 15, bottom: 5),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Biểu đồ tổng số ca mắc Covid-19',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: kTitleTextColor,
            ),
          ),
        ),
        loadingChartCard(),
      ],
    );
  }

  Widget loadingChartCard() {
    return Column(
      children: [
        Card(
          elevation: 5,
          shadowColor: kShadowColor,
          child: Container(
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Shimmer.fromColors(
              baseColor: Colors.white,
              highlightColor: Colors.grey,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Text("Cập nhật từ: " '--/-- đến --/--'),
        ),
      ],
    );
  }
}