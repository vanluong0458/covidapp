import 'package:covid_app/pages/home_screen/home_screen_country_detail.dart';
import 'package:covid_app/pages/home_screen/home_screen_global_detail.dart';
import 'package:covid_app/pages/home_screen/navigation_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum NavigationStatus {
  global,
  country,
}

class Tracker extends StatefulWidget {
  const Tracker({ Key? key }) : super(key: key);

  @override
  State<Tracker> createState() => _TrackerState();
}

class _TrackerState extends State<Tracker> {
  NavigationStatus navigationStatus = NavigationStatus.global;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Thông tin các nước",
        ),
        backgroundColor: Colors.green,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 1500),
              child: navigationStatus == NavigationStatus.country
                  ? const CountryDetail()
                  : const GlobalDetail(),
            ),
          ),
          SizedBox(
            height: size.height * 0.08,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                NavigationOption(
                  title: "Thế giới",
                  //icon: MaterialCommunityIcons.earth,
                  selected: navigationStatus == NavigationStatus.global,
                  onSelected: () {
                    setState(() {
                      navigationStatus = NavigationStatus.global;
                    });
                  },
                ),
                NavigationOption(
                  title: "Các quốc gia",
                  //icon: Ionicons.md_flag,
                  selected: navigationStatus == NavigationStatus.country,
                  onSelected: () {
                    setState(() {
                      navigationStatus = NavigationStatus.country;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}