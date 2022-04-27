import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OneInjection extends StatelessWidget {
  const OneInjection({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const Text('Chứng nhận tiêm chủng', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 15),
                  SvgPicture.asset('assets/icons/check-mark.svg', width: 100, height: 100),
                  const SizedBox(height: 15),
                  const Divider(color: Colors.black),
                  const SizedBox(height: 10),
                  const Text('Đã tiêm 01 mũi vắc xin', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Divider(color: Colors.black,),
                ],
              ),
              const SizedBox(height: 25),
              const Text('Thông tin cá nhân', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Họ và tên: Mai Văn Lượng', style: TextStyle(fontSize: 20)),
                    Text('Sinh ngày: 01/01/2000', style: TextStyle(fontSize: 20)),
                    Text('Số điện thoại: 0123456789', style: TextStyle(fontSize: 20)),
                    Text('Số CCCD/CMND: 221514303', style: TextStyle(fontSize: 20)),
                    Text('Đã được tiêm vắc xin COVID-19: ASTRAZECA', style: TextStyle(fontSize: 20)),
                  ],
                ),
              )
            ],            
          ),
        ),
      )
    );
  }
}