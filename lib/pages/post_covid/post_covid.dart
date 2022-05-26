import 'package:covid_app/pages/post_covid/video_post_covid.dart';
import 'package:covid_app/widgets/call.dart';
import 'package:covid_app/widgets/header.dart';
import 'package:flutter/material.dart';

class PostCovid extends StatefulWidget {
  const PostCovid({ Key? key }) : super(key: key);

  @override
  State<PostCovid> createState() => _PostCovidState();
}

class _PostCovidState extends State<PostCovid> {
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
                textMiddle: "      về hậu"
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Quay lại"),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.green),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          )
                        )
                      )
                    ),
                    ElevatedButton(
                      //onPressed: () {},
                      onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const VideoPostCovid())),
                      child: const Text("Video hậu Covid"),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.green),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          )
                        )
                      )
                    )
                  ]
                ),
              ),
              const Text(
                'HỘI CHỨNG HẬU COVID LÀ GÌ?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
              const Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  'Tổ chức Y tế Thế giới (WHO) đã công bố định nghĩa chính thức đầu tiên về hội chứng hậu COVID-19 (post COVID-19 condition). Theo đó, tình trạng hậu COVID-19 xảy ra ở những người có tiền sử nhiễm bệnh với các triệu chứng và kéo dài ít nhất 2 tháng mà không thể giải thích bằng chẩn đoán thay thế. Tình trạng này có thể khiến sức khỏe người bệnh bị suy giảm kéo dài, có tác động nghiêm trọng đến khả năng quay trở lại làm việc hoặc tham gia cuộc sống xã hội. Hậu COVID-19 ảnh hưởng đến sức khỏe tâm thần thể chất và có thể gây ra những hậu quả kinh tế đáng kể cho bản thân, gia đình và cho xã hội.',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'CÁC TRIỆU CHỨNG HẬU COVID',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
              const Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  'Có khoảng 200 triệu chứng liên quan đến hội chứng hậu COVID-19, đặc biệt ở những bệnh nhân đã trải qua điều trị hồi sức tích cực. Người nhiễm COVID-19 nhiều tuần đến nhiều tháng sau khi khỏi bệnh vẫn còn đối mặt với hàng loạt triệu chứng và di chứng kéo dài như sốt nhẹ, khó thở, ho kéo dài, mệt mỏi, đau cơ, khớp, rụng tóc, xơ phổi, tim đập nhanh hoặc đánh trống ngực, rối loạn nội tiết, huyết học bị huyết khối… Có trường hợp xuất hiện rối loạn tiêu hóa (ăn không ngon miệng, chán ăn, đau dạ dày, tiêu chảy…), rối loạn vị giác hoặc khứu giác, phát ban…',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  'Người bệnh trong giai đoạn hậu COVID-19 cũng có thể gặp các triệu chứng về tâm thần kinh như rối loạn tâm lý, giảm sự tập trung, lo âu, trầm cảm, bồn chồn, rối loạn giấc ngủ, mau quên, không tập trung. Thường xuất hiện tình trạng não sương mù, nhận thức kém, đọc chậm, giảm trí nhớ ngắn hạn, thay đổi tâm trạng.',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  'Với người có sẵn bệnh nền như bệnh tim mạch, tiểu đường, đặc biệt là hô hấp, viêm phổi tắc nghẽn mạn tính COPD, viêm phế quản mạn… khi COVID-19 xảy ra trên nền bệnh đó có thể khiến tổn thương vốn có của họ trở nên nặng hơn.',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  'Một số người khỏi bệnh sau khi mắc COVID-19 nghiêm trọng có thể gặp phải các ảnh hưởng xấu tới đa cơ quan hoặc bệnh tự miễn dịch trong một thời gian dài kèm theo các triệu chứng trong nhiều tuần hoặc nhiều tháng. Không chỉ biểu hiện bằng các triệu chứng lâm sàng kể trên, người bệnh còn có thể xuất hiện những bất thường cận lâm sàng như tăng men tim kéo dài, rối loạn đường huyết, rối loạn hormon giáp, giảm độ lọc cầu thận; rối loạn chức năng hô hấp (giảm độ khuếch tán phổi, hạn chế dung tích phổi; bất thường hình ảnh học, xơ phổi, giãn phế quản trên CT scan ngực) rối loạn chức năng tâm thất qua siêu âm tim...',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'PHƯƠNG PHÁP ĐIỀU TRỊ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
              const Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  'Khỏi COVID-19 người bệnh cần phải tiếp tục theo dõi và nâng cao sức khỏe toàn diện phục hồi chức năng, vật lý trị liệu, dinh dưỡng và chăm sóc tinh thần, giấc ngủ.',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Text(
                  '▪ Tập thở: Hít vào, thở ra chậm, hít sâu dần dần và thở ra nhẹ nhàng không vội vã và nhịp độ tăng lên từng ngày.',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Text(
                  '▪ Tập thể dục: Hàng ngày vận động nhẹ nhàng như đi bộ chậm, tập thể dục nhẹ, đạp xe đạp rất chậm, tập dưỡng sinh. Tập theo các chương trình thể dục trên đài truyền hình mỗi sáng lúc 5 giờ, nếu tự tập phải đảm bảo 30 phút hàng ngày.',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Text(
                  '▪ Đi bộ: Một nghiên cứu năm 2011 cho thấy người trưởng thành khỏe mạnh có thể đi bộ khoảng từ 4.000 đến 18.000 bước/ngày tùy theo yêu cầu. Tuy nhiên mục tiêu 10.000 bước/ngày là khá phù hợp cho người trưởng thành khỏe mạnh.',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Text(
                  '▪ Dinh dưỡng đúng: Nên chia bữa ăn thành 3-5 bữa mỗi ngày tùy theo sức ăn của người bệnh và kết hợp đa dạng thực phẩm trong khẩu phần ăn, nên ăn nhiều rau, trái cây, uống đủ nước, uống thêm nước ép trái cây, uống sữa, ăn chuối chín để bổ sung Kali. Bổ sung các loại vi chất do tác hại của bệnh COVID-19 nên ăn các loại thực phẩm có nhiều vi chất như cá, tôm, cua, hào, nghêu sò…',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Text(
                  '▪ Chăm sóc sức khỏe tinh thần: Ngủ đủ giấc, nghe nhạc, thư giãn và trao đổi thông tin với mọi người xung quanh để cuộc sống trở lại bình thường.',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'ĐỊA CHỈ KHÁM HẬU COVID-19',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
              Container(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 5),
                alignment: Alignment.centerLeft,
                child: const Text(
                  '- Bệnh viện Chợ Rẫy',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                alignment: Alignment.centerLeft,
                child: const Text(
                  '- Bệnh viện Bệnh Nhiệt đới TP. HCM',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                alignment: Alignment.centerLeft,
                child: const Text(
                  '- Bệnh viện Thống Nhất',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                alignment: Alignment.centerLeft,
                child: const Text(
                  '- Bệnh viện Đại học Y Dược',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                alignment: Alignment.centerLeft,
                child: const Text(
                  '- Bệnh viện Nhi đồng 1',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                alignment: Alignment.centerLeft,
                child: const Text(
                  '- Viện Y dược học dân tộc TP. HCM, Đồng Nai, Hà Nội…',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: const Text(
                  'GỌI HOTLINE CỦA BỘ Y TẾ: 19009095 KHI CÓ DẤU HIỆU NHƯ TRÊN',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 100),
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