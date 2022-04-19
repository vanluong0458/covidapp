
import 'package:assets_audio_player/assets_audio_player.dart';

class ListDataInfor {
  final String img;
  final String description;

  ListDataInfor({required this.img, required this.description});
}

List<ListDataInfor> symptoms = [
  ListDataInfor(
    img: "assets/symptoms/headache.svg",
    description: "Đau đầu",
  ),
  ListDataInfor(
    img: "assets/symptoms/fever.svg",
    description: "Sốt cao",
  ),
  ListDataInfor(
    img: "assets/symptoms/cough.svg",
    description: "Ho",
  ),
  ListDataInfor(
    img: "assets/symptoms/breathing.svg",
    description: "Đau họng",
  ),
];

List<ListDataInfor> prevention = [
  ListDataInfor(
    img: "assets/prevention/people.svg",
    description: "Đeo khẩu trang ở nơi đông người",
  ),
  ListDataInfor(
    img: "assets/prevention/work-from-home.svg",
    description: "Làm việc tại nhà (nếu có thể)",
  ),
  ListDataInfor(
    img: "assets/prevention/washing-hands.svg",
    description: "Rửa tay bằng xà phòng",
  ),
  ListDataInfor(
    img: "assets/prevention/keep-distance.svg",
    description: "Hạn chế tiếp xúc trực tiếp",
  ),
  ListDataInfor(
    img: "assets/prevention/bucket.svg",
    description: "Thường xuyên vệ sinh nhà cửa",
  ),
  ListDataInfor(
    img: "assets/prevention/touch-face.svg",
    description: "Không đưa tay lên mặt",
  ),
];

List<ListDataInfor> contagion = [
  ListDataInfor(
    img: "assets/contagion/virus-transmission.svg",
    description: "Giọt bắn khi tiếp xúc gần",
  ),
  ListDataInfor(
    img: "assets/contagion/patient.svg",
    description: "Tiếp xúc trực tiếp với người bệnh",
  ),
  ListDataInfor(
    img: "assets/contagion/contaminated.svg",
    description: "Tiếp xúc với bề mặt bị nhiễm bẩn",
  ),
  ListDataInfor(
    img: "assets/contagion/play-with-pet.svg",
    description: "Tiếp xúc với động vật hoang dã",
  ),
];

List<Audio> audioList = [
  Audio(
    'assets/music/ghencovy.mp3',
    metas: Metas(
      title: 'Ghen Cô Vy (Vietnamese Version)',
      artist: 'MIN, ERIK, Khắc Hưng',
      image: const MetasImage.asset('assets/images/ghencovy.jpg')
    )
  ),
  Audio(
    'assets/music/tugiaccachly.mp3',
    metas: Metas(
      title: 'Tự Giác Cách Ly',
      artist: 'Bùi Công Nam',
      image: const MetasImage.asset('assets/images/tugiaccachly.jpg')
    )
  ),
  Audio(
    'assets/music/Covid Nhanh Di Di - K-ICM_ APJ_ Huyen Ta.mp3',
    metas: Metas(
      title: 'Covid Nhanh Đi Đi',
      artist: 'K-ICM, APJ, Huyền Tâm Môn, Quang Đông, RYO',
      image: const MetasImage.asset('assets/images/covidnhanhdidi.png')
    )
  ),
  Audio(
    'assets/music/chienbinhxanhchongdich.mp3',
    metas: Metas(
      title: 'Chiến Binh Xanh Chống Dịch',
      artist: 'Lou Hoàng, Yến Nhi',
      image: const MetasImage.asset('assets/images/chienbinhxanhchongdich.jpg')
    )
  ),
  Audio(
    'assets/music/vietnamsechienthang.mp3',
    metas: Metas(
      title: 'Việt Nam Sẽ Chiến Thắng',
      artist: 'Nhiều ca sĩ',
      image: const MetasImage.asset('assets/images/vietnamsechienthang.jpg')
    )
  ),
  Audio(
    'assets/music/5kVuotQuaDaiDich-MAM-7065245.mp3',
    metas: Metas(
      title: '5k Vượt Qua Đại Dịch',
      artist: 'M.A.M',
      image: const MetasImage.asset('assets/images/namkvuotquadaidich.jpg')
    )
  ),
  Audio(
    'assets/music/ChongDichNhuChongGiac-UngDaiVe-6262561.mp3',
    metas: Metas(
      title: 'Chống Dịch Như Chống Giặc',
      artist: 'Ưng Đại Vệ',
      image: const MetasImage.asset('assets/images/chongdichnhuchonggiac.jpg')
    )
  ),
  Audio(
    'assets/music/Chung-Tay-Day-Lui-Covid-19-Do-Tuyet-Nhi.mp3',
    metas: Metas(
      title: 'Chung Tay Đẩy Lùi Covid 19',
      artist: 'Đỗ Tuyết Nhi',
      image: const MetasImage.asset('assets/images/chungtaydayluicovid.png')
    )
  ),
  Audio(
    'assets/music/Tien-Covid-Le-Thien-Hieu.mp3',
    metas: Metas(
      title: 'Tiễn Covid',
      artist: 'Lê Thiện Hiếu',
      image: const MetasImage.asset('assets/images/tiencovid.png')
    )
  ),
  Audio(
    'assets/music/vietnamtute.mp3',
    metas: Metas(
      title: 'Việt Nam Tử Tế',
      artist: 'Lam Trường, Hoàng Thùy Linh, Tóc Tiên, ERIK, Karik',
      image: const MetasImage.asset('assets/images/vietnamtute.jpg')
    )
  ),
];

class DataSource {
  static List questionAnswers = [
    {
      "question": "Virus Corona là gì?",
      "answer": "Corona là một họ virus lớn, trong đó một số chủng "
          "có khả năng gây bệnh khi xâm nhiễm từ động vật sang người, "
          "số khác chỉ xâm nhiễm và tồn tại ở các loài động vật bao gồm lạc đà, mèo và dơi. "
          "Đôi khi virus corona từ động vật tiến hóa để lây sang người để rồi sau đó lây từ "
          "người sang người như trường hợp Hội chứng Hô hấp Trung Đông (MERS) và hội chứng hô "
          "hấp cấp nặng (SARS). Hiện tại chủng virus corona gây dịch tại Vũ Hán (2019-nCoV) "
          "là một chủng mới chưa từng xuất hiện ở người và có khả năng lây từ người sang người."
    },
    {
      "question": "COVID-19 là gì?",
      "answer": "COVID-19 là bệnh truyền nhiễm do coronavirus được phát hiện "
          "gần đây nhất gây ra. Loại virus và căn bệnh mới này chưa"
          " được biết đến trước khi bùng phát ở Vũ Hán, Trung Quốc, vào tháng 12 năm 2019."
    },
    {
      "question": "Các triệu chứng của COVID-19 là gì?",
      "answer": "Các triệu chứng phổ biến nhất của COVID-19 là sốt,"
          " mệt mỏi và ho khan. Một số bệnh nhân có thể bị đau nhức, "
          "nghẹt mũi, chảy nước mũi, đau họng hoặc tiêu chảy. Các triệu chứng "
          "này thường nhẹ và bắt đầu dần dần. Một số người bị nhiễm bệnh nhưng không "
          "phát triển bất kỳ triệu chứng nào và không cảm thấy không khỏe. Hầu hết mọi "
          "người (khoảng 80%) đều khỏi bệnh mà không cần điều trị đặc biệt. Cứ 6 người "
          "nhiễm COVID-19 thì có 1 người bị bệnh nặng và khó thở. Người lớn tuổi và những "
          "người có các vấn đề y tế tiềm ẩn như huyết áp cao, bệnh tim hoặc tiểu đường, "
          "có nhiều khả năng phát triển bệnh nghiêm trọng hơn. Những người bị sốt, ho và "
          "khó thở nên tìm kiếm sự chăm sóc y tế. "
    },
    {
      "question": "COVID-19 lây lan như thế nào?",
      "answer": "Bằng chứng hiện nay cho thấy bệnh COVID-19 lây nhiễm ở người "
          "qua đường tiếp xúc trực tiếp, gián tiếp (qua các vật dụng hoặc bề mặt bị nhiễm mầm bệnh),"
          " hoặc tiếp xúc gần với người nhiễm bệnh qua dịch tiết từ miệng và mũi. Dịch tiết này bao "
          "gồm nước bọt, dịch tiết hô hấp hoặc các giọt bắn. Dịch tiết được phát "
          "xuất từ miệng hoặc mũi của người nhiễm bệnh  khi họ ho, hắt hơi, nói hoặc hát. "
          "Người tiếp xúc gần (trong vòng khoảng cách 1 mét) với người đã nhiễm bệnh có thể "
          "mắc bệnh COVID-19 khi các giọt bắn nhiễm bệnh này thâm nhập vào miệng, mũi hoặc mắt của người tiếp xúc."
          " Để tránh tiếp xúc với giọt bắn, quan trọng là cần giữ khoảng cách  "
          "và cách xa những người xung quanh ít nhất 1 mét, thường xuyên rửa"
          " tay và che miệng bằng khăn giấy hoặc khuỷu tay khi hắt hơi hoặc "
          "ho khạc. Khi không thể giữ khoảng cách tiếp xúc (đứng cách xa nhau ít nhất 1 mét), "
          "cần đeo khẩu trang vải để bảo vệ những người xung quanh. Cần rửa tay "
          "thường xuyên để phòng tránh mắc bệnh."
    },
    {
      "question":
          "Virus gây ra COVID-19 có thể lây truyền qua không khí không?",
      "answer":
          "Các nghiên cứu cho đến nay cho thấy vi rút gây ra COVID-19 chủ yếu "
              "lây truyền qua tiếp xúc với các giọt đường hô hấp hơn là qua không khí."
    },
    {
      "question":
          "Tôi nên làm gì khi nếu tôi hoặc ai đó trong nhà tôi mắc bệnh",
      "answer": "Những người đã tiếp xúc gần với người mắc COVID-19-ngoại trừ những người đã nhiễm COVID-19 trong khoảng"
          " 3 tháng vừa qua hoặc những người đã được tiêm chủng đầy đủ."
          "\n1. Những người đã xét nghiệm dương tính với COVID-19 trong vòng 3 tháng qua và đã khỏi bệnh không cần"
          "phải cách ly hoặc xét nghiệm lại, miễn là họ không bộc lộ các triệu chứng mới."
          "\n2. Những người tái phát triển các triệu chứng trong vòng 3 tháng kể từ lần đầu tiên"
          " bị bệnh COVID-19 "
          "có thể cần phải được xét nghiệm lại nếu không có "
          "nguyên nhân nào khác để hiểu rõ các triệu chứng của họ."
          "\n3. Những người đã tiếp xúc gần với người bị bệnh COVID-19 không buộc phải cách ly "
          "nếu họ đã được tiêm chủng đầy đủ ngừa bệnh dịch và không thấy có các triệu chứng."
    },
    {
      "question": "Khi nào tôi cần được chăm sóc khẩn cấp nếu mắc Covid-19",
      "answer":
          "Nếu có người đang biểu hiện bất cứ dấu hiệu nào trong số này, hãy tìm đến chăm sóc y tế cấp cứu ngay lập tức"
              "\n• Khó thở"
              "\n• Đau hoặc tức ngực thường xuyên"
              "\n• Trạng thái lẫn lộn mới"
              "\n• Không thể thức dậy hay duy trì sự tỉnh táo"
              "\n• Da, móng tay hoặc môi nhợt nhạt, xám hoặc có màu xanh, tùy vào tông da."
    },
    {
      "question": "Người không có triệu chứng có thể lây truyền virus không?",
      "answer": "Có. Người nhiễm bệnh có thể lây truyền virus cả khi họ "
          "có triệu chứng và khi họ không có triệu chứng. Do đó, cần "
          "xác định những người nhiễm bệnh bằng xét nghiệm, cách ly, và chăm sóc y tế, "
          "tùy thuộc vào mức độ nặng của bệnh. Thậm chí người đã được xác định mắc COVID-19 "
          "nhưng không có triệu chứng cũng cần được cách ly để hạn chế tiếp xúc với những người khác. "
          "Các biện pháp này nhằm mục đích ngăn chặn sự lây lan của bệnh. "
          "Luôn giữ khoảng cách tiếp xúc ít nhất 1 mét với những người xung quanh, "
          "cần che miệng bằng mặt trong của khuỷu tay hoặc khăn giấy khi ho hoặc hắt hơi, "
          "rửa tay thường xuyên và hãy ở nhà nếu bạn thấy người không khỏe hoặc khi được yêu"
          " cầu ở nhà. Tại các khu vực dịch bệnh lây lan rộng, người dân cần đeo khẩu trang vải khi không thể áp "
          "dụng các biện pháp giãn cách vật lý và các biện pháp kiểm soát khác. "
    },
    {
      "question": "Tôi có thể nhiễm COVID-19 từ phân của người mắc bệnh không?",
      "answer": "Nguy cơ nhiễm COVID-19 từ phân của một người bị nhiễm bệnh dường như thấp. "
          "Mặc dù các điều tra ban đầu cho thấy vi rút có thể có trong phân trong một số "
          "trường hợp, nhưng lây lan qua con đường này không phải là đặc điểm chính của đợt bùng phát. "
          "Đánh giá nghiên cứu đang tiến hành về các cách lây lan COVID-19 và "
          "sẽ tiếp tục chia sẻ những phát hiện mới. Tuy nhiên, vì đây là một nguy cơ,"
          " tuy nhiên, đó là một lý do khác để vệ sinh tay thường xuyên, sau khi đi vệ sinh và trước khi ăn. "
    },
    {
      "question": "Tôi có khả năng mắc COVID-19 như thế nào?",
      "answer": "Nguy cơ phụ thuộc vào vị trí của bạn - và cụ thể hơn là liệu có bùng phát COVID-19 ở đó"
          " hay không. Đối với hầu hết mọi người ở hầu hết các địa điểm, nguy cơ nhiễm "
          "COVID-19 vẫn thấp. Tuy nhiên, hiện có một vài nơi trên thế giới (các thành phố hoặc khu vực) "
          "nơi dịch bệnh đang lây lan. Đối với những người sống hoặc đến thăm, "
          "những khu vực này có nguy cơ nhiễm COVID-19 cao hơn."
          "Chính phủ và các cơ quan y tế đang hành động mạnh mẽ mỗi khi một trường hợp COVID-19 mới được"
          " xác định. Hãy đảm bảo tuân thủ mọi hạn chế của địa phương đối với việc đi lại, di chuyển hoặc "
          "tụ tập đông người. Hợp tác với các nỗ lực kiểm soát dịch bệnh sẽ giảm nguy cơ mắc hoặc lây lan COVID-19 của bạn. "
          "Các đợt bùng phát COVID-19 có thể được kiềm chế và ngừng lây lan, như đã thấy ở Trung Quốc và một số nước khác. "
          "Thật không may, những đợt bùng phát mới có thể bùng phát nhanh chóng. Điều quan trọng là phải nhận thức được"
          " tình hình nơi bạn đang hoặc dự định đến. WHO công bố thông tin cập "
          "nhật hàng ngày về tình hình COVID-19 trên toàn thế giới. "
    },
    {
      "question": "Ai có nguy cơ mắc bệnh nặng?",
      "answer": "Mặc dù chúng tôi vẫn đang tìm hiểu về mức độ ảnh hưởng "
          "của COVID-19 đối với mọi người, nhưng những người lớn tuổi và"
          " những người có bệnh tình từ trước (như huyết áp cao, bệnh tim, bệnh phổi, "
          "ung thư hoặc tiểu đường) dường như phát triển bệnh nghiêm trọng thường xuyên hơn những người khác. "
    },
    {
      "question": "Tôi có nên đeo khẩu trang để bảo vệ bản thân không?",
      "answer": "Khẩu trang giúp hạn chế việc bạn hít thở trực tiếp các giọt không khí có chứa virus "
          "và các tác nhân gây bệnh khác. Khẩu trang y tế thường có 3 lớp, lớp ngoài là lớp nilon sẽ"
          " giúp bạn ngăn các tác nhân có khả năng đi thẳng vào mũi bạn một cách dễ dàng. Hoặc khi "
          "tiếp xúc với người mang mầm bệnh đeo khẩu trang cũng giúp bạn ngăn ngừa virus xâm nhập trực"
          " tiếp qua đường hít thở khi người đó hắt hơi, ho hoặc nói chuyện."
          " Các cách hiệu quả nhất để bảo vệ bản thân và những người khác chống "
          "lại COVID-19 là thường xuyên rửa tay sạch sẽ, luôn mang khẩu trang khi phải đi ra nơi công cộng"
          ", hạn chế tụ tập đông người hoặc thực hiện việc giãn cách xã hội theo yêu cầu của chính quyền địa phương (nếu có), "
          "duy trì khoảng cách ít nhất 1 mét (3 feet) với những người đang ho hoặc hắt hơi."
    },
    {
      "question":
          "Thuốc kháng sinh có hiệu quả trong việc ngăn ngừa hoặc điều trị COVID-19 không?",
      "answer": "Không. Thuốc kháng sinh không hoạt động chống lại vi-rút, "
          "chúng chỉ hoạt động trên các bệnh nhiễm trùng do vi khuẩn. "
          "COVID-19 là do vi-rút gây ra, vì vậy thuốc kháng sinh không có tác dụng. "
          "Không nên sử dụng thuốc kháng sinh như một phương tiện phòng ngừa hoặc"
          " điều trị COVID-19. Chúng chỉ nên dùng theo chỉ định của bác sĩ để điều trị nhiễm trùng do vi khuẩn. "
    }
  ];
}