import 'package:flutter/material.dart';
import 'package:shop_task/src/model/error_result.dart';
import 'package:shop_task/src/model/home_data.dart';
import 'package:shop_task/src/model/product.dart';
import '../../services/remote_services/home_service/home_service_implementation.dart';
import 'states.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel() {
    _service = HomeServiceImplementation();
    states = HomeDataStates.initialState;
  }

  late HomeServiceImplementation _service;
  late HomeDataStates states;

  HomeData? _homeData;

  HomeData? get homeData => _homeData;

  List<Product>? _selectedProduct;

  List<Product>? get selectedProduct => _selectedProduct;

  ErrorResult? _errorResult;

  ErrorResult? get errorResult => _errorResult;

  int _selectedFeaturedProduct = 0;

  int get selectedFeaturedProduct => _selectedFeaturedProduct;

  Future<void> getHomeData() async {
    states = HomeDataStates.loadingState;
    await _service.getHomeData().then((value) {
      value.fold((left) {
        _homeData = left;
        _selectedProduct = _homeData!.latestSparPart;
        states = HomeDataStates.loadedState;
      }, (right) {
        _errorResult = right;
        states = HomeDataStates.errorState;
      });
    });
    notifyListeners();
  }

  void onSelectFeaturedButton(int value) {
    _selectedFeaturedProduct = value;
    switch (_selectedFeaturedProduct) {
      case 0:
        _selectedProduct = _homeData!.latestSparPart;
        break;
      case 1:
        _selectedProduct = _homeData!.latestCars;
        break;
      case 2:
        _selectedProduct = _homeData!.proMoreArr;
        break;
    }
    notifyListeners();
  }
}
