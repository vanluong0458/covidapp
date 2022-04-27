import 'package:covid_app/constant.dart';
import 'package:covid_app/pages/dashboard.dart';
import 'package:covid_app/pages/home_screen/home_screen_counter_detail.dart';
import 'package:covid_app/pages/home_screen/models/global_model.dart';
import 'package:covid_app/widgets/call.dart';
import 'package:flutter/material.dart';

class CountryStatisticsNew extends StatefulWidget {
  const CountryStatisticsNew({ Key? key }) : super(key: key);

  @override
  State<CountryStatisticsNew> createState() => _CountryStatisticsNewState();
}

class _CountryStatisticsNewState extends State<CountryStatisticsNew> {
  late final Future<GlobalModel> globalData;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    globalData = covidService.fetchSummaryVNData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GlobalModel>(
      future: globalData,
      builder: (context, snapshot) {
        if (snapshot.hasData ) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30.0, bottom: 10),
                    child: Container(
                      child: const Text('Việt Nam', style: kTitleTextstyle),
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CounterDetail(
                        color: kInfectedColor,
                        number: snapshot.data!.cases!,
                        title: "Nhiễm bệnh",
                        subtitle: snapshot.data!.todayCases!,
                      ),
                      CounterDetail(
                        color: kRecovercolor,
                        number: snapshot.data!.recovered!,
                        title: "Hồi phục",
                        subtitle: snapshot.data!.todayRecovered!,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CounterDetail(
                        color: kPrimaryColor,
                        number: snapshot.data!.active!,
                        title: "Đang điều trị",
                        subtitle: snapshot.data!.critical!,
                      ),
                      CounterDetail(
                        color: kDeathColor,
                        number: snapshot.data!.deaths!,
                        title: "Tử vong",
                        subtitle: snapshot.data!.todayDeaths!,
                      ),
                    ]
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        InkWell(
                          onTap: launchURL,
                          child: Text.rich(
                            TextSpan(
                              text: 'Nguồn: ',
                              children: [
                                TextSpan(
                                  text: 'Bộ Y Tế, WHO',
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      });
  }
}