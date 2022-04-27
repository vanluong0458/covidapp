import 'package:covid_app/constant.dart';
import 'package:covid_app/pages/vaccinations/add_info_family.dart';
import 'package:covid_app/widgets/info_item_vaccin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class FamilyDetail extends StatefulWidget {
  const FamilyDetail({ Key? key }) : super(key: key);

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
    var userid = user.uid;
    dref.child(userid+"/zfamily").child('').child('typevaccin').once().then((snapshot) {
      setState(() {
        typevaccin = snapshot.snapshot.value.toString();
      });
    });
    dref.child(userid+"/zfamily").child('').child('birthday').once().then((snapshot) {
      setState(() {
        birthday = snapshot.snapshot.value.toString();
      });
    });
    dref.child(userid+"/zfamily").child('username').once().then((snapshot) {
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
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.of(context).push(MaterialPageRoute(builder: (_) => const AddInfoFamily(),));
                  //   },
                  //   child: const Text('Khai báo')
                  // ),
                  const SizedBox(height: 20),
                  const Text("Danh sách đã khai báo", style: kTitleTextstyle),
                  // InfoVaccinItem(
                  //   icon: "assets/icons/username.svg",
                  //   name: name,
                  //   typevaccin: typevaccin,
                  //   birthday: birthday,
                  // ),
                  FirebaseAnimatedList(
                    shrinkWrap: true,
                    query: dref,
                    itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation animation, int index) {
                      if(snapshot.value != null) {
                        // return ListTile(
                        //   leading: Text(snapshot.value['username'].toString()),
                        //   title: Text(snapshot.value['typevaccin'].toString()),
                        //   subtitle: Text(snapshot.value['dayvaccin'].toString()),
                        // );
                        return InfoVaccinItem(
                          icon: "assets/icons/username.svg",
                          name: name,
                          typevaccin: typevaccin,
                          birthday: birthday,
                        );
                      } else {
                        return Center(
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              "Vui lòng kiểm tra lại kết nối mạng",
                              style: TextStyle(color: Colors.red, fontSize: 18),
                            ),
                          ),
                        );
                      }
                    }
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => const AddInfoFamily(),));
        },
        tooltip: 'Khai báo',
        backgroundColor: Colors.green[800],
        child: const Icon(Icons.border_color_outlined),
      ),
    );
  }
}