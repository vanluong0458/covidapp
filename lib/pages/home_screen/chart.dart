import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class Charts extends StatelessWidget {

  final List<charts.Series<TimeSeriesCases, DateTime>> seriesList;

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