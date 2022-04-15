import 'package:covid_app/constant.dart';
import 'package:covid_app/login.dart';
import 'package:covid_app/widgets/header.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Profile extends StatefulWidget {
  const Profile({ Key? key }) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  DatabaseReference dref = FirebaseDatabase.instance.ref("users");
  final user = FirebaseAuth.instance.currentUser!;
  var name = "Đang lấy dữ liệu...";
  var phone = "Đang lấy dữ liệu...";

  showData() {
    var userid = user.uid;
    dref.child("${userid}/phone").once().then((snapshot) {
      setState(() {
        phone = snapshot.snapshot.value.toString();
      });
    });
    dref.child("${userid}/username").once().then((snapshot) {
      setState(() {
        name = snapshot.snapshot.value.toString();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    showData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyHeader(
                image: "assets/icons/id-card.svg",
                textTop: "        THÔNG TIN",
                textBottom: "",
                textMiddle: "         CÁ NHÂN"
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Hồ sơ của tôi", style: kTitleTextstyle,),
                    ProfileItem(
                      icon: "assets/icons/username.svg",
                      title: "Họ và tên",
                      text: name,
                    ),
                    ProfileItem(
                      icon: "assets/icons/gmail.svg",
                      title: "Email",
                      text: user.email.toString(),
                    ),
                    ProfileItem(
                      icon: "assets/icons/phone-call.svg",
                      title: "Số điện thoại",
                      text: phone,
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.green[800]
                      ),
                      child: Center(
                        child: TextButton(
                          onPressed: () {
                            FirebaseAuth.instance.signOut();
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
                          },
                          child:  const Text("Đăng xuất"),
                          style: TextButton.styleFrom(primary: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 35),
                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final String icon;
  final String title;
  final String text;
  const ProfileItem({
    Key? key, required this.icon, required this.title, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 130,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 30,
                    color: kShadowColor,
                  ),
                ],
              ),
              child: SvgPicture.asset(
                icon,
                alignment: Alignment.centerLeft,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              left: 90,
              child: Container(
                height: 100,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                width: MediaQuery.of(context).size.width - 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      title,
                      style: kTitleTextstyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      text,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}