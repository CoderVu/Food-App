import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_demo/controllers/cart_controller.dart';
import 'package:project_demo/data/respository/popular_product_repo.dart';
import 'package:project_demo/models/cart.dart';
import 'package:project_demo/models/products.dart';

import 'package:project_demo/utils/colors.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<ProductModel> _popularProductList = [];
  List<ProductModel> get popularProductList => _popularProductList;

  late CartController _cartController;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int _quantity = 0;
  int get quantity => _quantity; // Quantity to be passed to the detail page

  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity; // InCartItems to be passed to the detail page

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      print("getPopularProductList: OK");
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoading = true;
      update(); // Update the UI
    } else {
      print("Error in getPopularProduct");
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      print("numberof iitems " + _quantity.toString());
      print("isIncrement" );
      _quantity = checkQuantity(_quantity + 1);
    } else {
      print("isDecrement");
      print("numberof iitems " + _quantity.toString());
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

int checkQuantity(int quantity) {
  if ((_inCartItems + quantity) < 0) {
    Get.snackbar("Error", "Item count can't be less than 0",
      backgroundColor: AppColors.mainColor,
      colorText: Colors.white,
    );
    return 0;
  } 
  if ((_inCartItems + quantity) > 20) {
    Get.snackbar("Error", "Item count can't be more than 20",
      backgroundColor: AppColors.mainColor,
      colorText: Colors.white,
    );
    return 20;
  }
  _quantity = _inCartItems + quantity;
  return _quantity;
}


  void initProduct(CartController cartController, ProductModel product) {
    _quantity = 0;
    _inCartItems = 0;
    _cartController = cartController;
    bool exist = _cartController.existInCart(product);
    print("exist or not: $exist");
    if (exist) {
      _quantity = _cartController.getQuantity(product);
      _inCartItems = _quantity;
    }
    //print("Quantity in the cart is: $_quantity");
  }

  void addItemToCart(ProductModel product) {
   if (_quantity>0) {
    _cartController.addItem(product, _quantity);
    _quantity = 0;
    _cartController.cartItems.forEach((key, value) {
      print("Key: $key, Value: ${value.name}" + " The quality is " + value.quantity.toString());
    }
    );
    
   }
   else {
     Get.snackbar("Error", "Please select at least one item in the cart",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
   }
   update();
  }
  int get totalItems{
    return _cartController.totalItems;
  }
  List<CartModel> get cartItems {
    return _cartController.cartItemsList;
  }
}