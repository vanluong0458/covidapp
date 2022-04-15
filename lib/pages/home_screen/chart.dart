import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class Charts extends StatelessWidget {

  final List<charts.Series<TimeSeriesCases, DateTime>> seriesList;
  // {
  //   final data = [
  //     TimeSeriesCases(DateTime(2017, 9, 19), 5),
  //     TimeSeriesCases(DateTime(2017, 9, 26), 25),
  //     TimeSeriesCases(DateTime(2017, 10, 3), 100),
  //     TimeSeriesCases(DateTime(2017, 10, 10), 75),
  //   ];

  //   return [
  //     charts.Series<TimeSeriesCases, DateTime>(
  //     id: 'Cases',
  //     colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
  //     domainFn: (TimeSeriesCases cases, _) => cases.time,
  //     measureFn: (TimeSeriesCases cases, _) => cases.cases,
  //     data: data,
  //     )
  //   ];
  // }

  const Charts({ Key? key, required this.seriesList }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return charts.TimeSeriesChart(
      seriesList,
      animate: true,
      domainAxis: const charts.EndPointsTimeAxisSpec(),
      dateTimeFactory: const charts.LocalDateTimeFactory(),
    );
  }
}

class TimeSeriesCases {
  final DateTime time;
  final int cases;

  TimeSeriesCases(this.time, this.cases);
}