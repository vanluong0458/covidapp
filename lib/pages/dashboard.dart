import 'package:covid_app/pages/home_screen/country_loading.dart';
import 'package:covid_app/pages/home_screen/country_statistics.dart';
import 'package:covid_app/pages/home_screen/country_statistics_chart.dart';
import 'package:covid_app/pages/home_screen/models/country_model.dart';
import 'package:covid_app/pages/home_screen/models/country_summany.dart';
import 'package:covid_app/pages/home_screen/tracker.dart';
import 'package:covid_app/services/covid_services.dart';
import 'package:covid_app/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:covid_app/constant.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({ Key? key }) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

CovidService covidService = CovidService();

class _DashboardState extends State<Dashboard> {
  final controller = ScrollController();
  //final TextEditingController textEditingController = TextEditingController();
  late Future<List<CountryModel>> countryList;

  late Future<List<CountrySummaryChartModel>> summaryChartList;
  late Future<CountrySummaryNewModel> summaryNewList;

  //_DashboardState(this.summaryChartList, this.summaryNewList);
  late GlobalKey<RefreshIndicatorState> _refreshKey;

  double offset = 1;
  // final focus = FocusNode();
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

  // List<String> _getSuggestions(List<CountryModel> list, String query) {
  //   List<String> matches = [];
  //   for (var item in list) {
  //     matches.add(item.country);
  //   }
  //   matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
  //   return matches;
  // }

  @override
  void initState() {
    super.initState();
    onRefresh();
  }

  onRefresh() async {
    setState(() {
      controller.addListener(onScroll);
      countryList = covidService.getCountryList();

      //textEditingController.text = "Việt Nam";
      summaryChartList = covidService.getCountrySummary("vietnam");
      summaryNewList = covidService.getCountrySummaryNew("vietnam");
      _refreshKey = GlobalKey<RefreshIndicatorState>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CountryModel>>(
      future: countryList,
      builder: (context, snapshot) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: RefreshIndicator(
            key: _refreshKey,
            onRefresh: () => onRefresh(),
            child: SingleChildScrollView(
              controller: controller,
              child: Column(
                children: [
                  const MyHeader(
                    image: "assets/icons/Drcorona.svg",
                    textTop: "Hãy bảo vệ",
                    textMiddle: "   Bản thân",
                    textBottom: "      và Gia đình",
                  ),
                  //textFieldCustom(context, snapshot),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          "Thông tin dịch bệnh",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: kTitleTextColor,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => const Tracker(),
                            ));
                          },
                          child: const Text(
                            "Xem chi tiết",
                            style: TextStyle(
                              fontSize: 14,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  FutureBuilder<CountrySummaryNewModel>(
                    future: summaryNewList,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: Center(
                            child: Text(
                              "Vui lòng kiểm tra lại kết nối mạng",
                              style: TextStyle(color: Colors.red),
                            ),
                          )
                        );
                      }
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return Center(
                            child: Container(
                                alignment: Alignment.center,
                                child: const CountryLoading(inputTextLoading: false)),
                          );
                        default:
                          return !snapshot.hasData
                              ? const Center(
                                  child: Text(""),
                                )
                              : CountryStatisticsNew(
                                  summaryNewList: snapshot.data!,
                                );
                      }
                    },
                  ),
                  FutureBuilder<Iterable>(
                    future: summaryChartList,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: Center(
                            child: Text(
                              "Vui lòng kiểm tra lại kết nối mạng",
                              style: TextStyle(color: Colors.red),
                            ),
                          )
                        );
                      }
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return Center(
                            child: Container(
                                alignment: Alignment.center,
                                child: const CountryChartLoading(
                                    inputTextLoading: false)),
                          );
                        default:
                          return !snapshot.hasData
                              ? const Center(
                                  child: Text("Không có dữ liệu"),
                                )
                              : CountryStatistics(
                                  summaryChartList: List<CountrySummaryChartModel>.from(snapshot.data!),
                                );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Widget textFieldCustom(
  //     BuildContext context, AsyncSnapshot<List<CountryModel>> snapshot) {
  //   return Padding(
  //     padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
  //     child: TypeAheadFormField(
  //       textFieldConfiguration: TextFieldConfiguration(
  //         controller: textEditingController,
  //         decoration: InputDecoration(
  //           hintText: 'Nhập quốc gia cần tìm',
  //           hintStyle: const TextStyle(fontSize: 15),
  //           contentPadding: const EdgeInsets.all(10),
  //           border: const OutlineInputBorder(
  //             borderRadius: BorderRadius.all(
  //               Radius.circular(40),
  //             ),
  //           ),
  //           suffixIcon: Row(
  //             mainAxisAlignment: MainAxisAlignment.end,
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               GestureDetector(
  //                   onTap: () {
  //                     setState(() {
  //                       textEditingController.clear();
  //                     });
  //                   },
  //                   child: FocusScope.of(context).hasFocus
  //                       ? const Icon(Icons.clear)
  //                       : const Icon(
  //                           Icons.clear,
  //                           color: Colors.transparent,
  //                         )),
  //               const Padding(
  //                 padding: EdgeInsets.symmetric(horizontal: 10),
  //                 child: Icon(Icons.search),
  //               ),
  //             ],
  //           ),
  //           prefixIcon: const Icon(
  //             Icons.location_on,
  //             color: kPrimaryColor,
  //           ),
  //         ),
  //       ),
  //       suggestionsCallback: (pattern) {
  //         return _getSuggestions(snapshot.data ?? [], pattern);
  //       },
  //       itemBuilder: (context, suggestion) {
  //         return ListTile(
  //           title: Text(suggestion.toString()),
  //         );
  //       },
  //       transitionBuilder: (context, suggestionsBox, controller) {
  //         return suggestionsBox;
  //       },
  //       onSuggestionSelected: (suggestion) {
  //         textEditingController.text = suggestion.toString();
  //         setState(() {
  //           summaryChartList = covidService.getCountrySummary(snapshot.data ?? []
  //               .firstWhere((element) => element.country == suggestion)
  //               .slug);
  //           summaryNewList = covidService.getCountrySummaryNew(snapshot.data ?? []
  //               .firstWhere((element) => element.country == suggestion)
  //               .slug);
  //           FocusScope.of(context).unfocus();
  //         });
  //       },
  //       // errorBuilder: (BuildContext context, Object error) => Container(
  //       //   padding: const EdgeInsets.only(left: 15),
  //       //   height: 40,
  //       //   alignment: Alignment.centerLeft,
  //       //   child: Text(
  //       //     'Không có dữ liệu',
  //       //     style: TextStyle(color: Theme.of(context).errorColor),
  //       //   ),
  //       // ),
  //     ),
  //   );
  // }
}

