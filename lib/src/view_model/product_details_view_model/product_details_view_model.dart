import 'package:flutter/material.dart';
import 'package:shop_task/src/model/product_details.dart';
import '../../model/error_result.dart';
import '../../services/remote_services/home_service/home_service_implementation.dart';
import 'states.dart';

class ProductDetailsViewModel extends ChangeNotifier {
  ProductDetailsViewModel() {
    _service = HomeServiceImplementation();
    states = ProductDetailsStates.initialState;
  }

  late HomeServiceImplementation _service;
  late ProductDetailsStates states;

  ProductDetails? _product;

  ProductDetails? get product => _product;

  ErrorResult? _errorResult;

  ErrorResult? get errorResult => _errorResult;

  Future<void> getProductDetails({required String id}) async {
    states = ProductDetailsStates.loadingState;
    await _service.getProductDetails(id: id).then((value) {
      value.fold((left) {
        _product = left;
        states = ProductDetailsStates.loadedState;
      }, (right) {
        _errorResult = right;
        states = ProductDetailsStates.errorState;
      });
    });
    notifyListeners();
  }
}
