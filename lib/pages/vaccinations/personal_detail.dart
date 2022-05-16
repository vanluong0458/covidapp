import 'package:covid_app/constant.dart';
import 'package:covid_app/pages/vaccinations/add_info.dart';
import 'package:covid_app/widgets/info_item_vaccin.dart';
import 'package:covid_app/widgets/one_injection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class PersonalDetail extends StatefulWidget {
  const PersonalDetail({ Key? key }) : super(key: key);

  @override
  State<PersonalDetail> createState() => _PersonalDetailState();
}

class _PersonalDetailState extends State<PersonalDetail> {
  DatabaseReference dref = FirebaseDatabase.instance.ref("uservaccin");
  final user = FirebaseAuth.instance.currentUser!;
  var name = "...";
  var typevaccin = "...";
  var birthday = "...";
  
  showData() {
    var userid = user.uid;
    dref.child(userid+"/typevaccin").once().then((snapshot) {
      setState(() {
        typevaccin = snapshot.snapshot.value.toString();
      });
    });
    dref.child(userid+"/birthday").once().then((snapshot) {
      setState(() {
        birthday = snapshot.snapshot.value.toString();
      });
    });
    dref.child(userid+"/username").once().then((snapshot) {
      setState(() {
        name = snapshot.snapshot.value.toString();
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
                  const Text("Thông tin mũi tiêm đã khai báo", style: kTitleTextstyle),
                  FutureBuilder<DatabaseEvent>(
                    future: dref.child(user.uid).once(),
                    builder: (context, snapshot) {
                      return snapshot.data?.snapshot.value == null
                      ? Container(
                        height: 500,
                        alignment: Alignment.center,
                        child: const Center(
                            child: Text("Không có dữ liệu", style: TextStyle(fontSize: 24, color: Colors.red)),
                          ),
                      )
                      : InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => const OneInjection()));
                          },
                          child: InfoVaccinItem(
                            icon: "assets/icons/username.svg",
                            name: name,
                            typevaccin: typevaccin,
                            birthday: birthday,
                          ),
                        );
                    }
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => const AddInfo(),));
        },
        tooltip: 'Khai báo',
        backgroundColor: Colors.green,
        child: const Icon(Icons.border_color_outlined),
      ),
    );
  }
}