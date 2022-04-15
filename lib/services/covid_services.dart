import 'dart:convert';

import 'package:covid_app/pages/home_screen/models/country_model.dart';
import 'package:covid_app/pages/home_screen/models/country_summany.dart';
import 'package:http/http.dart' as http;

class CovidService {
  Future<CountryModel> getGlobalSummary() async {
    final data =
        await http.Client().get(Uri.parse("https://disease.sh/v3/covid-19/countries"));

    if (data.statusCode != 200) throw Exception();

    CountryModel summary = CountryModel.fromJson(json.decode(data.body));

    return summary;
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

  Future<CountrySummaryNewModel> getCountrySummaryNew(String slug) async {
    final response =
        await http.get(Uri.parse('https://disease.sh/v3/covid-19/countries/' + slug));

    if (response.statusCode == 200) {
      return CountrySummaryNewModel.fromJson(jsonDecode(response.body));
    }
    else {
      //return null;
      throw UnimplementedError();
    }
  }

  Future<List<CountryModel>> getCountryList() async {
    final data =
        await http.Client().get(Uri.parse('https://nntanhung.github.io/countries.json'));

    if (data.statusCode != 200) throw Exception();

    List<CountryModel> countries = (json.decode(data.body) as List)
        .map((item) => CountryModel.fromJson(item))
        .toList();

    return countries;
  }
}
