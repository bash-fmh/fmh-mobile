class MealModelResponse {
  MealModelResponse({this.meals});
  List<MealModel>? meals;

  MealModelResponse.fromJson(Map<String, dynamic> json) {
    meals = (json['meals'] as List?)
        ?.map((e) => MealModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}

class MealModel {
  String? mealName;
  String? idMeal;
  String? strMealThumb;
  MealModel({required this.mealName, this.idMeal, this.strMealThumb});

  MealModel.fromJson(Map<String, dynamic> json) {
    mealName = json['strMeal'] as String?;
    idMeal = json['idMeal'] as String?;
    strMealThumb = json['strMealThumb'] as String?;
  }
}

class CustomItem {
  String? name;
  String? price;
  String? desc;
  bool? favourite;
  String? image;
  CustomItem({
    this.name,
    this.price,
    this.desc,
    this.favourite: false,
    this.image,
  });

  @override
  String toString() {
    return 'CustomItem{name: $name, price: $price, desc: $desc, favourite: $favourite, image: $image}';
  }
}

class ProductItem {
  String? name;
  List<CustomItem>? products;
  ProductItem({
    this.name,
    this.products,
  });

  @override
  String toString() {
    return 'ProductItem{name: $name, products: $products}';
  }
}
