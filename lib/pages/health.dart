//import 'package:appcovid/constant.dart';
import 'package:covid_app/data/list_data.dart';
import 'package:covid_app/widgets/call.dart';
import 'package:covid_app/widgets/header.dart';
import 'package:covid_app/widgets/info_item_images.dart';
import 'package:flutter/material.dart';

class Health extends StatefulWidget {
  const Health({ Key? key }) : super(key: key);

  @override
  State<Health> createState() => _HealthState();
}

class _HealthState extends State<Health> {
  final controller = ScrollController();

  double offset = 8;

  @override
  void initState() {
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const MyHeader(
                image: "assets/icons/coronadr.svg",
                textTop: "Điều cần biết",
                textBottom: "   Covid - 19",
                textMiddle: "         về"
              ),
              InfoItemImages(
                title: 'Triệu chứng',
                listDataInfors: symptoms,
              ),
              InfoItemImages(
                title: 'Nguồn lây nhiễm',
                listDataInfors: contagion,
              ),
              InfoItemImages(
                title: 'Phòng ngừa',
                listDataInfors: prevention,
              ),
              const SizedBox(height: 50,)
            ],
          ),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: callPhone,
        tooltip: 'Gọi ngay',
        backgroundColor: Colors.green,
        child: Icon(Icons.call),
      ),
    );
  }
}