import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shop_task/src/view_model/cart_view_model/states.dart';
import 'package:shop_task/utils/helper/cache_helper.dart';
import '../../model/cart_product.dart';

class CartViewModel extends ChangeNotifier {
  CartViewModel() {
    addStates = CartAddProductStates.initialState;
    deleteStates = CartDeleteProductStates.initialState;
    getCartProducts();
  }

  late CartAddProductStates addStates;
  late CartDeleteProductStates deleteStates;

  List<CartProduct>? _cartProducts = [];

  List<CartProduct>? get cartProducts => _cartProducts;

  double _totalPrice = 0.0;

  double get totalPrice => _totalPrice;

  getCartProducts() {
    String? localData = CacheHelper.getStringData(key: 'cartKey');
    if (localData != null) {
      List<dynamic> jsonData = jsonDecode(localData);
      List<CartProduct> localCartProducts =
          jsonData.map((e) => CartProduct.fromMap(e)).toList();
      _cartProducts!.addAll(localCartProducts);
      getTotalPrice();
    } else {
      _cartProducts = [];
    }
    notifyListeners();
  }

  getTotalPrice() {
    for (int i = 0; i < _cartProducts!.length; i++) {
      _totalPrice +=
          (double.parse(_cartProducts![i].price) * _cartProducts![i].quantity);
    }
    notifyListeners();
  }

  Future<void> addToCart({required CartProduct cartProduct}) async {
    for (int i = 0; i < _cartProducts!.length; i++) {
      if (_cartProducts![i].id == cartProduct.id) {
        addStates = CartAddProductStates.errorState;
        return;
      }
    }
    _cartProducts!.add(cartProduct);
    _totalPrice += (double.parse(cartProduct.price) * cartProduct.quantity);
    await CacheHelper.setStringData(
        key: 'cartKey',
        value: jsonEncode(_cartProducts!.map((e) => e.toMap()).toList()));
    addStates = CartAddProductStates.successState;
    notifyListeners();
  }

   deleteFromCart({required CartProduct cartProduct}) async {
    for (int i = 0; i < _cartProducts!.length; i++) {
      if (_cartProducts![i].id == cartProduct.id) {
        _cartProducts!.remove(cartProduct);
        await CacheHelper.removeData(key: 'cartKey').then((value) async {
          await CacheHelper.setStringData(
              key: 'cartKey',
              value: jsonEncode(_cartProducts!.map((e) => e.toMap()).toList()));
        });
        deleteStates = CartDeleteProductStates.successState;
        notifyListeners();
      }
    }
    notifyListeners();
  }

  incrementQuantity({required int index}) {
    if(_cartProducts![index].quantity >= 0){
      _cartProducts![index].quantity += 1;
      _totalPrice += (double.parse(_cartProducts![index].price));
    }
    notifyListeners();
  }

  decrementQuantity({required int index}) {
    if(_cartProducts![index].quantity > 1){
      _cartProducts![index].quantity--;
      _totalPrice -= (double.parse(_cartProducts![index].price));
    }
    notifyListeners();
  }
}
