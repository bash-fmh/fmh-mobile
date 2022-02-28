class CountryModelResponse {
  CountryModelResponse({this.countries});
  List<CountryModel>? countries;

  CountryModelResponse.fromJson(Map<String, dynamic> json) {
    countries = (json['meals'] as List?)
        ?.map((e) => CountryModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}

class CountryModel {
  String? country;
  bool? selected = false;
  CountryModel({required this.country, this.selected});

  CountryModel.fromJson(Map<String, dynamic> json) {
    country = json['strArea'] as String?;
  }
}
