import 'package:covid_app/pages/health_declaration/family_declaration.detail.dart';
import 'package:covid_app/pages/health_declaration/per_declaration_detail.dart';
import 'package:covid_app/pages/home_screen/navigation_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum NavigationStatus {
  personal,
  family,
}

class HealthDeclaration extends StatefulWidget {
  const HealthDeclaration({ Key? key }) : super(key: key);

  @override
  State<HealthDeclaration> createState() => _HealthDeclarationState();
}

class _HealthDeclarationState extends State<HealthDeclaration> {
  NavigationStatus navigationStatus = NavigationStatus.personal;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Khai báo F0",
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
                  ? const FamilyDeclarationDetail()
                  : const PerDeclarationDetail(),
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