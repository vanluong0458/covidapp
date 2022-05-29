import 'dart:convert';
import 'package:covid_app/pages/home_screen/models/country_summany.dart';
import 'package:covid_app/pages/home_screen/models/global_model.dart';
import 'package:http/http.dart' as http;

class CovidService {

  Future<GlobalModel> fetchSummaryVNData() async {
    http.Response response =
        await http.get(Uri.parse('https://disease.sh/v3/covid-19/countries/vietnam'));
    if (response.statusCode == 200) {
      return GlobalModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Không thể tải dữ liệu');
    }
  }

  Future<List<CountrySummaryChartModel>> getCountrySummary(String slug) async {
    final data = await http.Client()
        .get(Uri.parse("https://api.covid19api.com/total/dayone/country/" + slug));
    if (data.statusCode != 200) throw Exception();

    List<CountrySummaryChartModel> summaryList =
        (json.decode(data.body) as List)
            .reversed
            .map((item) => CountrySummaryChartModel.fromJson(item))
            .take(90)
            .toList();
    return summaryList;
  }
}
