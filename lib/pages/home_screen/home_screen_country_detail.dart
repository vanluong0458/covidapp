import 'dart:convert';

import 'package:covid_app/constant.dart';
import 'package:covid_app/pages/home_screen/home_screen_counter_detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountryDetail extends StatefulWidget {
  const CountryDetail({ Key? key }) : super(key: key);

  @override
  State<CountryDetail> createState() => _CountryDetailState();
}

class _CountryDetailState extends State<CountryDetail> {
  late List countryData;
  var isLoading = false;
  final ScrollController _scrollController = ScrollController();
  int _currentMax = 20;

  Future _fetchCountryData() async {
    setState(() {
      isLoading = true;
    });
    var url = 'https://disease.sh/v3/covid-19/countries?sort=cases';

    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      _currentMax = _currentMax + 20;
      setState(() {
        countryData = json.decode(response.body);
        setState(() {
          isLoading = false;
        });
      });
    } else {
      throw Exception('Không thể tải dữ liệu');
    }
  }

  @override
  void initState() {
    super.initState();
    countryData = List.generate(20, (index) => _fetchCountryData());
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _countryListView();
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
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
            )
          : _countryListView(),
    );
  }

  Widget _countryListView() {
    return ListView.builder(
      itemCount: countryData == null ? 0 : countryData.length,
      physics: const BouncingScrollPhysics(),
      controller: _scrollController,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          elevation: 3,
          shadowColor: kShadowColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: kBackgroundColor,
          child: ExpansionTile(
            title: Row(
              children: <Widget>[
                Text('${index + 1}'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    elevation: 5,
                    child: Image.network(
                      countryData[index]['countryInfo']['flag'],
                      width: 50,
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    countryData[index]["country"].toString(),
                    overflow: TextOverflow.fade,
                    style: kTitleTextstyle,
                  ),
                ),
              ],
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CounterDetail(
                          color: kInfectedColor,
                          number: countryData[index]['cases'],
                          title: "Nhiễm bệnh",
                          subtitle: countryData[index]['todayCases'],
                        ),
                        CounterDetail(
                          color: kRecovercolor,
                          number: countryData[index]['recovered'],
                          title: "Hồi phục",
                          subtitle: countryData[index]['todayRecovered'],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CounterDetail(
                          color: kPrimaryColor,
                          number: countryData[index]['active'],
                          title: "Đang điều trị",
                          subtitle: countryData[index]['critical'],
                        ),
                        CounterDetail(
                          color: kDeathColor,
                          number: countryData[index]['deaths'],
                          title: "Tử vong",
                          subtitle: countryData[index]['todayDeaths'],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}