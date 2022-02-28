class ConstantUrl {
  ConstantUrl._();

  static const String countryList = 'v1/1/list.php?a=list';

  static String mealList(String country) => 'v1/1/filter.php?a=$country';
}
