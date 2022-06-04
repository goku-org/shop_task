import 'package:dartz/dartz.dart';
import 'package:shop_task/src/model/error_result.dart';
import '../../../model/home_data.dart';
import '../../../model/product_details.dart';

abstract class HomeServiceRepository{
  Future<Either<HomeData, ErrorResult>> getHomeData();
  Future<Either<ProductDetails, ErrorResult>> getProductDetails({required String id});
}