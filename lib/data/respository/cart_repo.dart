import 'dart:convert';
import 'package:project_demo/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project_demo/models/cart.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<String> cart = [];
  List<String> cartHistory = [];

  void addToCartList(List<CartModel> cartList) {
    var time = DateTime.now().toString();
    cartList.forEach((element) {
      element.time = time;
      return cart.add(jsonEncode(element));
    });

    cart = cartList.map((e) => jsonEncode(e.toJson())).toList();
    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
    getToCartList();
  }

  List<CartModel> getToCartList() {
    List<String> cartData = sharedPreferences.getStringList(AppConstants.CART_LIST) ?? [];
    return cartData.map((e) => CartModel.fromJson(jsonDecode(e))).toList();
  }

  List<CartModel> getCartHistoryList() {
    List<String> cartHistoryData = sharedPreferences.getStringList(AppConstants.CART_HISTOTY_LIST) ?? [];
    return cartHistoryData.map((e) => CartModel.fromJson(jsonDecode(e))).toList();
  }

  void addToCartHistoryList() {
    cartHistory = sharedPreferences.getStringList(AppConstants.CART_HISTOTY_LIST) ?? [];
    cartHistory.addAll(cart);
    removeCart();
    sharedPreferences.setStringList(AppConstants.CART_HISTOTY_LIST, cartHistory);
    print("The length of the history list is: ${getCartHistoryList().length}");
    for (var item in getCartHistoryList()) {
      print("The item is: ${item.name}");
      print("The time is: ${item.time}");
    }
    
  }

  void removeCart() {
    cart = [];
    sharedPreferences.remove(AppConstants.CART_LIST);
  }
}
