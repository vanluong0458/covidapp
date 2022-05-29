import 'package:covid_app/pages/home_screen/navigation_option.dart';
import 'package:covid_app/pages/vaccinations/family_detail.dart';
import 'package:covid_app/pages/vaccinations/personal_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum NavigationStatus {
  personal,
  family,
}

class Vaccination extends StatefulWidget {
  const Vaccination({ Key? key }) : super(key: key);

  @override
  State<Vaccination> createState() => _VaccinationState();
}

class _VaccinationState extends State<Vaccination> {
  NavigationStatus navigationStatus = NavigationStatus.personal;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Thông tin tiêm chủng",
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
              child: navigationStatus == NavigationStatus.family
                  ? const FamilyDetail()
                  : const PersonalDetail(),
            ),
          ),
          SizedBox(
            height: size.height * 0.08,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                NavigationOption(
                  title: "Cá nhân",
                  selected: navigationStatus == NavigationStatus.personal,
                  onSelected: () {
                    setState(() {
                      navigationStatus = NavigationStatus.personal;
                    });
                  },
                ),
                NavigationOption(
                  title: "Gia đình",
                  selected: navigationStatus == NavigationStatus.family,
                  onSelected: () {
                    setState(() {
                      navigationStatus = NavigationStatus.family;
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