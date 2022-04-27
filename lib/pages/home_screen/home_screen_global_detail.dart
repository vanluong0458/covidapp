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

class _GlobalDetailState extends State<GlobalDetail> {
  late Future<GlobalModel> globalData;
  var isLoading = false;
  Future<GlobalModel> _fetchGlobalData() async {
    http.Response response =
        await http.get(Uri.parse('https://disease.sh/v3/covid-19/all'));
    if (response.statusCode == 200) {
      return GlobalModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Không thể tải dữ liệu');
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
                if (snapshot.hasError) {
                  return Center(
                      child: Container(
                          alignment: Alignment.center,
                          child: const Text(
                        "Vui lòng kiểm tra lại kết nối mạng",
                        style: TextStyle(color: Colors.red, fontSize: 18),
                      ),),
                    );
                }
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(
                      child: Container(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text('Đang tải dữ liệu', style: TextStyle(fontSize: 18),),
                              SizedBox(height: 10),
                              CircularProgressIndicator()
                            ]
                          )
                      ),
                    );
                  default:
                    return !snapshot.hasData
                        ? const Center(
                            child: Text("Không có dữ liệu", style: TextStyle(fontSize: 18, color: Colors.white)),
                          )
                        : Padding(
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
                }
              }
            ),
    );
  }
}