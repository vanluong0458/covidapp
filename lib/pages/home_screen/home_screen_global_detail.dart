import 'dart:convert';

import 'package:covid_app/constant.dart';
import 'package:covid_app/pages/home_screen/home_screen_counter_detail.dart';
import 'package:covid_app/pages/home_screen/models/global_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GlobalDetail extends StatefulWidget {
  const GlobalDetail({ Key? key }) : super(key: key);

  @override
  State<GlobalDetail> createState() => _GlobalDetailState();
}

// Future<GlobalModel>? globalData;
// var isLoading = false;

class _GlobalDetailState extends State<GlobalDetail> {
  late Future<GlobalModel> globalData;
  var isLoading = false;
  Future<GlobalModel> _fetchGlobalData() async {
    http.Response response =
        await http.get(Uri.parse('https://disease.sh/v3/covid-19/all'));
    if (response.statusCode == 200) {
      return GlobalModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    globalData = _fetchGlobalData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : FutureBuilder<GlobalModel>(
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
                              child: const Text('Thế giới', style: kTitleTextstyle),
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
                          )
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
              }),
    );
  }
}