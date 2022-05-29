import 'package:covid_app/constant.dart';
import 'package:covid_app/pages/vaccinations/add_info_family.dart';
import 'package:covid_app/widgets/family_injection.dart';
import 'package:covid_app/widgets/info_item_vaccin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FamilyDetail extends StatefulWidget {
  const FamilyDetail({Key? key}) : super(key: key);

  @override
  State<FamilyDetail> createState() => _FamilyDetailState();
}

class _FamilyDetailState extends State<FamilyDetail> {
  DatabaseReference dref = FirebaseDatabase.instance.ref("uservaccin");
  final user = FirebaseAuth.instance.currentUser!;
  var name = "Đang lấy dữ liệu...";
  var typevaccin = "Đang lấy dữ liệu...";
  var birthday = "Đang lấy dữ liệu...";

  showData() {
    dref.child(user.uid + "/afamily").once().then((snapshot) {
      setState(() {
        typevaccin = (snapshot.snapshot.value as Map)
            .values
            .first['typevaccin']
            .toString();
        birthday = (snapshot.snapshot.value as Map)
            .values
            .first['birthday']
            .toString();
        name = (snapshot.snapshot.value as Map)
            .values
            .first['username']
            .toString();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    dref = FirebaseDatabase.instance.ref("uservaccin");
    showData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text("Danh sách đã khai báo", style: kTitleTextstyle),
                  FutureBuilder<DatabaseEvent>(
                      future: dref.child(user.uid + "/afamily").once(),
                      builder: (context, snapshot) {
                        return snapshot.data?.snapshot.value == null
                        ? Container(
                          height: 500,
                          alignment: Alignment.center,
                          child: const Center(
                              child: Text("Không có dữ liệu", style: TextStyle(fontSize: 24, color: Colors.red)),
                            ),
                        )
                        : Column(
                            children: (snapshot.data!.snapshot.value as Map)
                                .values
                                .map(
                                  (value) => InkWell(
                                    onTap: () {
                                      var username = value['username'];
                                      var birthday = value['birthday'];
                                      var typevaccin = value['typevaccin'];
                                      var phone = value['phone'];
                                      var cccd = value['cccd'];
                                      var number = value['number'];
                                      Navigator.of(context).push(MaterialPageRoute(
                                        builder: (_) => FamilyInjection(
                                          username: username,
                                          birthday: birthday,
                                          typevaccin: typevaccin,
                                          phone: phone,
                                          cccd: cccd,
                                          number: number
                                        )
                                      ));
                                    },
                                    child: InfoVaccinItem(
                                      icon: "assets/icons/username.svg",
                                      name: value['username'].toString(),
                                      typevaccin: value['typevaccin'].toString(),
                                      birthday: value['birthday'].toString(),
                                    ),
                                  ),
                                )
                                .toList(),
                          );
                      })
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => const AddInfoFamily(),
          ));
        },
        tooltip: 'Khai báo',
        backgroundColor: Colors.green[800],
        child: const Icon(Icons.border_color_outlined),
      ),
    );
  }
}
