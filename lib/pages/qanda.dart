import 'package:covid_app/constant.dart';
import 'package:covid_app/data/list_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QandA extends StatefulWidget {
  const QandA({ Key? key }) : super(key: key);

  @override
  State<QandA> createState() => _QandAState();
}

class _QandAState extends State<QandA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.green.shade900,
                  Colors.green.shade500,
                  Colors.green.shade400,
                ]
            )
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 40, top: 20, right: 20),
              height: 170,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/virus.png"))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Expanded(
                    child: Stack(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/new-normality.svg",
                          width: 130,
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                        Positioned(
                          top: 20,
                          left: 150,
                          child: Text(
                            'Các câu hỏi\nthường gặp\nvề COVID - 19',
                            style: kHeadingTextStyle.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 0,
                          child: ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Icon(Icons.arrow_back_sharp, color: Colors.white),
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(15),
                              primary: Colors.blue,
                            ),
                          )
                        ),
                        Container(),
                      ],
                    )
                  )
                ],
              ),
            ),
            
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                child: ListView.builder(
                  itemCount: DataSource.questionAnswers.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 2,
                      shadowColor: kShadowColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ExpansionTile(
                        title: Text(
                          "Hỏi: " + DataSource.questionAnswers[index]['question'],
                          style: const TextStyle(
                            fontSize: 15,
                            color: kTitleTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text.rich(
                              TextSpan(
                                text: 'Trả lời: ',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: DataSource.questionAnswers[index]['answer'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                      color: kBodyTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}