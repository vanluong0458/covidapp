import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FamilyInjection extends StatelessWidget {
  final String username;
  final String birthday;
  final String typevaccin;
  final String phone;
  final String cccd;
  final String number;
  const FamilyInjection(
    { Key? key, required this.username, required this.birthday, required this.typevaccin, required this.phone, required this.cccd, required this.number }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: number == '1' ? Colors.yellow : Colors.green,
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
                  number == '1' ? const Text('Đã tiêm 01 mũi vắc xin', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)):const Text('Đã tiêm 02 mũi vắc xin', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
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
                  children: [
                    Text('Họ và tên: '+ username, style: const TextStyle(fontSize: 20)),
                    Text('Sinh ngày: '+ birthday, style: const TextStyle(fontSize: 20)),
                    Text('Số điện thoại: '+ phone, style: const TextStyle(fontSize: 20)),
                    Text('Số CCCD: '+ cccd, style: const TextStyle(fontSize: 20)),
                    Text('Đã được tiêm vắc xin COVID-19: '+ typevaccin, style: const TextStyle(fontSize: 20)),
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

// class FamilyInjection extends StatefulWidget {
//   const FamilyInjection(
//     username,
//     birthday,
//     typevaccin,
//     phone,
//     cccd,
//     number,
//     { Key? key }
//   ) : super(key: key);

//   @override
//   State<FamilyInjection> createState() => _FamilyInjectionState();
// }

// class _FamilyInjectionState extends State<FamilyInjection> {
//   DatabaseReference dref = FirebaseDatabase.instance.ref("uservaccin");
//   final user = FirebaseAuth.instance.currentUser!;
//   var name = "Đang lấy dữ liệu...";
//   var typevaccin = "Đang lấy dữ liệu...";
//   var birthday = "Đang lấy dữ liệu...";
//   var phone = "Đang lấy dữ liệu...";
//   var cccd = "Đang lấy dữ liệu...";
//   var number = "Đang lấy dữ liệu...";
  
//   showData() {
//     dref.child(user.uid + "/afamily").once().then((snapshot) {
//       setState(() {
//         typevaccin = (snapshot.snapshot.value as Map)
//             .values
//             .first['typevaccin']
//             .toString();
//         birthday = (snapshot.snapshot.value as Map)
//             .values
//             .first['birthday']
//             .toString();
//         name = (snapshot.snapshot.value as Map)
//             .values
//             .first['username']
//             .toString();
//         number = (snapshot.snapshot.value as Map)
//             .values
//             .first['number']
//             .toString();
//         phone = (snapshot.snapshot.value as Map)
//             .values
//             .first['phone']
//             .toString();
//         cccd = (snapshot.snapshot.value as Map)
//             .values
//             .first['cccd']
//             .toString();        
//       });
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     dref = FirebaseDatabase.instance.ref("uservaccin");
//     //showData();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: number == '1' ? Colors.yellow : Colors.green,
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(40),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const SizedBox(height: 20),
//                   const Text('Chứng nhận tiêm chủng', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                   const SizedBox(height: 15),
//                   SvgPicture.asset('assets/icons/check-mark.svg', width: 100, height: 100),
//                   const SizedBox(height: 15),
//                   const Divider(color: Colors.black),
//                   const SizedBox(height: 10),
//                   number == '1' ? const Text('Đã tiêm 01 mũi vắc xin', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)):const Text('Đã tiêm 02 mũi vắc xin', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
//                   const SizedBox(height: 10),
//                   const Divider(color: Colors.black,),
//                 ],
//               ),
//               const SizedBox(height: 25),
//               const Text('Thông tin cá nhân', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//               const SizedBox(height: 15),
//               Container(
//                 padding: const EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: Colors.white,
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('Họ và tên: '+ name, style: const TextStyle(fontSize: 20)),
//                     Text('Sinh ngày: '+ birthday, style: const TextStyle(fontSize: 20)),
//                     Text('Số điện thoại: '+ phone, style: const TextStyle(fontSize: 20)),
//                     Text('Số CCCD: '+ cccd, style: const TextStyle(fontSize: 20)),
//                     Text('Đã được tiêm vắc xin COVID-19: '+ typevaccin, style: const TextStyle(fontSize: 20)),
//                   ],
//                 ),
//               )
//             ],            
//           ),
//         ),
//       )
//     );
//   }
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     backgroundColor: number == '1' ? Colors.yellow : Colors.green,
//   //     body: SingleChildScrollView(
//   //       child: Container(
//   //         padding: const EdgeInsets.all(40),
//   //         child: Column(
//   //           crossAxisAlignment: CrossAxisAlignment.start,
//   //           children: [
//   //             Column(
//   //               mainAxisAlignment: MainAxisAlignment.center,
//   //               children: [
//   //                 const SizedBox(height: 20),
//   //                 const Text('Chứng nhận tiêm chủng', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//   //                 const SizedBox(height: 15),
//   //                 SvgPicture.asset('assets/icons/check-mark.svg', width: 100, height: 100),
//   //                 const SizedBox(height: 15),
//   //                 const Divider(color: Colors.black),
//   //                 const SizedBox(height: 10),
//   //                 number == '1' ? const Text('Đã tiêm 01 mũi vắc xin', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)):const Text('Đã tiêm 02 mũi vắc xin', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
//   //                 const SizedBox(height: 10),
//   //                 const Divider(color: Colors.black,),
//   //               ],
//   //             ),
//   //             const SizedBox(height: 25),
//   //             const Text('Thông tin cá nhân', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//   //             const SizedBox(height: 15),
//   //             Container(
//   //               padding: const EdgeInsets.all(20),
//   //               decoration: BoxDecoration(
//   //                 borderRadius: BorderRadius.circular(20),
//   //                 color: Colors.white,
//   //               ),
//   //               child: Column(
//   //                 crossAxisAlignment: CrossAxisAlignment.start,
//   //                 children: [
//   //                   Text('Họ và tên: '+ name, style: const TextStyle(fontSize: 20)),
//   //                   Text('Sinh ngày: '+ birthday, style: const TextStyle(fontSize: 20)),
//   //                   Text('Số điện thoại: '+ phone, style: const TextStyle(fontSize: 20)),
//   //                   Text('Số CCCD: '+ cccd, style: const TextStyle(fontSize: 20)),
//   //                   Text('Đã được tiêm vắc xin COVID-19: '+ typevaccin, style: const TextStyle(fontSize: 20)),
//   //                 ],
//   //               ),
//   //             )
//   //           ],            
//   //         ),
//   //       ),
//   //     )
//   //   );
//   // }
// }