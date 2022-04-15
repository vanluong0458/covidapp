
import 'package:covid_app/pages/audio.dart';
import 'package:covid_app/pages/dashboard.dart';
import 'package:covid_app/pages/health.dart';
import 'package:covid_app/pages/news.dart';
import 'package:covid_app/pages/profile.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({ Key? key }) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentTab = 0;
  final List<Widget> screens = [
    const Dashboard(),
    const Health(),
    const NewsScreen(),
    const AudioScreen(),
    const Profile(),
  ];
  final PageStorageBucket buckets = PageStorageBucket();
  Widget currentScreen = const Dashboard();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageStorage(
        child: currentScreen,
        bucket: buckets,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: const Icon(Icons.music_note_rounded),
        onPressed: () {
          setState(() {
            currentScreen = const AudioScreen();
            currentTab = 4;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const Dashboard();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.dashboard,
                          color: currentTab == 0 ? Colors.green : Colors.grey,
                        ),
                        Text(
                          "Trang chủ",
                          style: TextStyle(
                            color: currentTab == 0 ? Colors.green : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),

                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const Health();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.health_and_safety_sharp,
                          color: currentTab == 1 ? Colors.green : Colors.grey,
                        ),
                        Text(
                          "Sức khỏe",
                          style: TextStyle(
                            color: currentTab == 1 ? Colors.green : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const NewsScreen();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.document_scanner_sharp,
                          color: currentTab == 2 ? Colors.green : Colors.grey,
                        ),
                        Text(
                          "Tin tức",
                          style: TextStyle(
                            color: currentTab == 2 ? Colors.green : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),

                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const Profile();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.supervised_user_circle,
                          color: currentTab == 3 ? Colors.green : Colors.grey,
                        ),
                        Text(
                          "Hồ sơ của tôi",
                          style: TextStyle(
                            color: currentTab == 3 ? Colors.green : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}