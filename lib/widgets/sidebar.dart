import 'package:covid_app/pages/news.dart';
import 'package:covid_app/pages/profile.dart';
import 'package:covid_app/pages/vaccinations/vaccination.dart';
import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      )
    );
  }

  Widget buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
    );
  }

  Widget buildMenuItems(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 16,
        children: [
          ListTile(
            leading: const Icon(Icons.people_alt_outlined),
            title: const Text('Hồ sơ cá nhân', style: TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Profile()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.border_color_outlined),
            title: const Text('Khai báo tiêm chủng', style: TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Vaccination()));
            },
          ),
          const Divider(color: Colors.black54),
          ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: const Text('Đăng xuất', style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NewsScreen()));
            },
          ),
        ],
      ),
    );
  }
}