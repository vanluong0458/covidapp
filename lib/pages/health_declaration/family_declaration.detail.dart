import 'package:covid_app/constant.dart';
import 'package:covid_app/pages/health_declaration/add_family_declaration.dart';
import 'package:covid_app/widgets/info_item_declaration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FamilyDeclarationDetail extends StatefulWidget {
  const FamilyDeclarationDetail({ Key? key }) : super(key: key);

  @override
  State<FamilyDeclarationDetail> createState() => _FamilyDeclarationDetailState();
}

class _FamilyDeclarationDetailState extends State<FamilyDeclarationDetail> {
  DatabaseReference dref = FirebaseDatabase.instance.ref("userDeclaration");
  final user = FirebaseAuth.instance.currentUser!;
  var name = "...";
  var dateF0 = "...";
  var birthday = "...";
  var dateDeclaration = "...";
  var f0 = "...";
  
  showData() {
    dref.child(user.uid + "/family").once().then((snapshot) {
      setState(() {
        dateF0 = (snapshot.snapshot.value as Map)
            .values
            .first['dateF0']
            .toString();
        dateDeclaration = (snapshot.snapshot.value as Map)
            .values
            .first['dateDeclaration']
            .toString();
        f0 = (snapshot.snapshot.value as Map)
            .values
            .first['f0']
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
    dref = FirebaseDatabase.instance.ref("userDeclaration");
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
                  const Text("Th??ng tin c??c l???n b??? F0 c???a gia ????nh", style: kTitleTextstyle),
                  FutureBuilder<DatabaseEvent>(
                    future: dref.child(user.uid + "/family").once(),
                    builder: (context, snapshot) {
                      return snapshot.data?.snapshot.value == null
                      ? Container(
                        height: 500,
                        alignment: Alignment.center,
                        child: const Center(
                            child: Text("Kh??ng c?? d??? li???u", style: TextStyle(fontSize: 24, color: Colors.red)),
                          ),
                      )
                      : Column(
                            children: (snapshot.data!.snapshot.value as Map)
                                .values
                                .map(
                                  (value) => InfoDeclarationItem(
                                    icon: "assets/icons/username.svg",
                                    name: value['username'].toString(),
                                    birthday: value['birthday'].toString(),
                                    dateDeclaration: value['dateDeclaration'].toString(),
                                    f0: value['f0'].toString(),
                                    dateF0: value['dateF0'].toString(),
                                  ),
                                )
                                .toList(),
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
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => const AddFamilyDeclaration(),));
        },
        tooltip: 'Khai b??o',
        backgroundColor: Colors.green[800],
        child: const Icon(Icons.border_color_outlined),
      ),
    );
  }
}