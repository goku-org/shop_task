import 'package:shop_task/src/model/category.dart';
import 'package:shop_task/src/model/product.dart';
import 'package:shop_task/src/model/slider.dart';

class HomeData {
  HomeData({
    required this.sliders,
    required this.latestSparPart,
    required this.latestCars,
    required this.imgOffer,
    required this.categories,
    required this.latestProducts,
    required this.proMoreArr,
  });

  final List<SliderImage> sliders;
  final List<Product> latestSparPart;
  final List<Product> latestCars;
  final String imgOffer;
  final List<Category> categories;
  final List<Product> latestProducts;
  final List<Product> proMoreArr;

  factory HomeData.fromMap(Map<String, dynamic> json) => HomeData(
        sliders:
            List<SliderImage>.from(json["sliders"].map((x) => SliderImage.fromMap(x))),
        latestSparPart: List<Product>.from(
            json["latest_spar_part"].map((x) => Product.fromMap(x))),
        latestCars: List<Product>.from(
            json["latest_cars"].map((x) => Product.fromMap(x))),
        imgOffer: json["img_offer"],
        categories:
            List<Category>.from(json["cats"].map((x) => Category.fromMap(x))),
        latestProducts: List<Product>.from(
            json["latest_products"].map((x) => Product.fromMap(x))),
        proMoreArr: List<Product>.from(
            json["pro_more_arr"].map((x) => Product.fromMap(x))),
      );
}
