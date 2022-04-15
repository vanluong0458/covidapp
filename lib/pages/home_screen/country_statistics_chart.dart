import 'package:covid_app/constant.dart';
import 'package:covid_app/pages/home_screen/models/country_summany.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:covid_app/pages/home_screen/chart.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class CountryStatistics extends StatelessWidget {
  final List<CountrySummaryChartModel> summaryChartList;

  const CountryStatistics({ Key? key, required this.summaryChartList }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return summaryChartList.isNotEmpty? Column(
      children: [
        Container(
          padding: const EdgeInsets.only(
              top: 25, left: 15, right: 15, bottom: 5),
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
        buildCardChart(summaryChartList),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(
            "Cập nhật từ: " +
              DateFormat("dd/MM/yyyy").format(summaryChartList[summaryChartList.length - 1].date) +
                " đến " +
              DateFormat("dd/MM/yyyy").format(summaryChartList[0].date),
          ),
        ),
      ],
    )
    : Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                "Không có dữ liệu về quốc gia hoặc vùng lãnh thổ này",
                style: TextStyle(fontSize: 25, color: kPrimaryColor),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCardChart(List<CountrySummaryChartModel> summaryChartList) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Card(
        elevation: 5,
        shadowColor: kShadowColor,
        child: Container(
          height: 250,
          padding: const EdgeInsets.only(left: 5, top: 10, bottom: 10),
          child: Charts(seriesList: _createData(summaryChartList)),
        ),
      ),
    );
  }

  static List<charts.Series<TimeSeriesCases, DateTime>> _createData(
    List<CountrySummaryChartModel> summaryChartList) {
    List<TimeSeriesCases> confirmedData = [];
    List<TimeSeriesCases> activeData = [];
    List<TimeSeriesCases> recoveredData = [];
    List<TimeSeriesCases> deathData = [];

    for (var item in summaryChartList) {
      confirmedData.add(TimeSeriesCases(item.date, item.confirmed));
      activeData.add(TimeSeriesCases(item.date, item.active));
      recoveredData.add(TimeSeriesCases(item.date, item.recovered));
      deathData.add(TimeSeriesCases(item.date, item.death));
    }

    return [
      charts.Series<TimeSeriesCases, DateTime>(
        id: 'Confirmed',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(kInfectedColor),
        domainFn: (TimeSeriesCases cases, _) => cases.time,
        measureFn: (TimeSeriesCases cases, _) => cases.cases,
        data: confirmedData,
      ),
      charts.Series<TimeSeriesCases, DateTime>(
        id: 'Active',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(kPrimaryColor),
        domainFn: (TimeSeriesCases cases, _) => cases.time,
        measureFn: (TimeSeriesCases cases, _) => cases.cases,
        data: activeData,
      ),
      charts.Series<TimeSeriesCases, DateTime>(
        id: 'Recovered',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(kRecovercolor),
        domainFn: (TimeSeriesCases cases, _) => cases.time,
        measureFn: (TimeSeriesCases cases, _) => cases.cases,
        data: recoveredData,
      ),
      charts.Series<TimeSeriesCases, DateTime>(
        id: 'Death',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(kDeathColor),
        domainFn: (TimeSeriesCases cases, _) => cases.time,
        measureFn: (TimeSeriesCases cases, _) => cases.cases,
        data: deathData,
      ),
    ];
  }
}