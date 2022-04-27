class CountrySummaryChartModel {
  final String country;
  final int confirmed;
  final int death;
  final int recovered;
  final int active;
  final DateTime date;

  CountrySummaryChartModel(this.country, this.confirmed, this.death,
    this.recovered, this.active, this.date);

  factory CountrySummaryChartModel.fromJson(Map<String, dynamic> json) {
    return CountrySummaryChartModel(
      json['Country'],
      json['Confirmed'],
      json['Deaths'],
      json['Recovered'],
      json['Active'],
      DateTime.parse(json['Date']),
    );
  }
}
