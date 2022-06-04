import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:shop_task/src/model/error_result.dart';
import 'package:shop_task/src/model/home_data.dart';
import '../../../../core/dio_exception_handling.dart';
import '../../../../core/status_code_error_handling.dart';
import '../../../../utils/helper/dio_helper.dart';
import '../../../model/product_details.dart';
import 'home_service_repository.dart';

class HomeServiceImplementation extends HomeServiceRepository {
  @override
  Future<Either<HomeData, ErrorResult>> getHomeData() async {
    try {
      var response = await DioHelper.getData(url: 'home');
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = response.data;
        if (jsonData['success'] == true) {
          HomeData homeData = HomeData.fromMap(jsonData['data']);
          return Left(homeData);
        } else {
          ErrorResult errorResult = ErrorResult(
              image: 'assets/images/server_error.png', message: 'other'.tr());
          return Right(errorResult);
        }
      } else {
        return Right(returnResponse(response: response));
      }
    } on DioError catch (exception) {
      return Right(
        DioExceptionHandling.dioExceptionHandling(
            exceptionType: exception.type, response: exception.response),
      );
    }
  }

  @override
  Future<Either<ProductDetails, ErrorResult>> getProductDetails(
      {required String id}) async {
    try {
      var response = await DioHelper.getData(url: 'product_details/$id');
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = response.data;
        if (jsonData['success'] == true) {
          ProductDetails productDetails =
              ProductDetails.fromMap(jsonData['data']);
          return Left(productDetails);
        } else {
          ErrorResult errorResult = ErrorResult(
              image: 'assets/images/server_error.png', message: 'other'.tr());
          return Right(errorResult);
        }
      } else {
        return Right(returnResponse(response: response));
      }
    } on DioError catch (exception) {
      return Right(
        DioExceptionHandling.dioExceptionHandling(
            exceptionType: exception.type, response: exception.response),
      );
    }
  }
}
