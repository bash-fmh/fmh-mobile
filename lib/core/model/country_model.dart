class CountryModelResponse {
  CountryModelResponse({this.countries});
  List<CountryModel>? countries;

  CountryModelResponse.fromJson(Map<String, dynamic> json) {
    countries = (json['countries'] as List?)
        ?.map((e) => CountryModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}

class CountryModel {
  int? id;
  String? name;
  String? code;
  String? image;
  bool? selected = false;
  CountryModel({
    required this.id,
    required this.name,
    required this.code,
    required this.image,
    this.selected,
  });

  CountryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    code = json['code'] as String?;
    image = json['image'] as String?;
  }
}
