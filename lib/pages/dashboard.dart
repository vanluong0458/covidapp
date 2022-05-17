import 'package:covid_app/pages/home_screen/country_loading.dart';
import 'package:covid_app/pages/home_screen/country_statistics.dart';
import 'package:covid_app/pages/home_screen/country_statistics_chart.dart';
import 'package:covid_app/pages/home_screen/models/country_summany.dart';
import 'package:covid_app/pages/home_screen/tracker.dart';
import 'package:covid_app/services/covid_services.dart';
import 'package:covid_app/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:covid_app/constant.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({ Key? key }) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

CovidService covidService = CovidService();

class _DashboardState extends State<Dashboard> {
  late Future<List<CountrySummaryChartModel>> summaryChartList;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    onRefresh();
  }

  onRefresh() async {
    setState(() {
      summaryChartList = covidService.getCountrySummary("vietnam");
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            const MyHeader(
              image: "assets/icons/Drcorona.svg",
              textTop: "Hãy bảo vệ",
              textMiddle: "   Bản thân",
              textBottom: "      và Gia đình",
            ),
            Container(
              padding:
                  const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    "Thông tin dịch bệnh",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: kTitleTextColor,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const Tracker(),
                      ));
                    },
                    child: const Text(
                      "Xem thêm",
                      style: TextStyle(
                        fontSize: 14,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const CountryStatisticsNew(),
            FutureBuilder<Iterable>(
              future: summaryChartList,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Center(
                      child: Text(
                        "Vui lòng kiểm tra lại kết nối mạng",
                        style: TextStyle(color: Colors.red),
                      ),
                    )
                  );
                }
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(
                      child: Container(
                          alignment: Alignment.center,
                          child: const CountryChartLoading(
                              inputTextLoading: false)),
                    );
                  default:
                    return !snapshot.hasData
                        ? const Center(
                            child: Text("Không có dữ liệu"),
                          )
                        : CountryStatistics(
                            summaryChartList: List<CountrySummaryChartModel>.from(snapshot.data!),
                          );
                }
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
    );
  }
}

