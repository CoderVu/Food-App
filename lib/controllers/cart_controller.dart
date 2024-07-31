import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_demo/data/respository/cart_repo.dart';
import 'package:project_demo/models/cart.dart';
import 'package:project_demo/models/products.dart';
import 'package:project_demo/utils/colors.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});
  
  final Map<int, CartModel> _cartItems = {}; // id, CartModel
  Map<int, CartModel> get cartItems => _cartItems; // id, CartModel
// 0, 1 ,2 ... 20
  void addItem(ProductModel product, int quantity) {
    if (product.id == null) return;

    print('Adding item to cart: id: ${product.id} + items ${quantity.toString()}');

    var totalQuantity = quantity;
    if (_cartItems.containsKey(product.id)) {
      totalQuantity += _cartItems[product.id]!.quantity!;
    }

    if (totalQuantity <= 0) {
      _cartItems.remove(product.id);
    } else if (totalQuantity > 20) {
      Get.snackbar("Error", "Item count can't be more than 20",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return;
    } else {
      _cartItems.update(product.id!, (existingCartItem) {
        return CartModel(
          id: product.id,
          name: product.name,
          price: product.price,
          quantity: totalQuantity,
          img: product.img,
          isExits: true,
          time: DateTime.now().toString(),
          product: product
        );
      }, ifAbsent: () {
        return CartModel(
          id: product.id,
          name: product.name,
          price: product.price,
          quantity: quantity,
          img: product.img,
          isExits: true,
          time: DateTime.now().toString(),
          product: product
        );
      });
    }
    update();
  }

  bool existInCart(ProductModel product) {
    return product.id != null && _cartItems.containsKey(product.id);
  }

  int getQuantity(ProductModel product) {
    if (product.id == null) return 0;
    
    return _cartItems[product.id]?.quantity ?? 0;
  }
  int get totalItems {
    var totalQuantity = 0;
    _cartItems.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }
  List<CartModel> get cartItemsList {
    return _cartItems.entries.map((e){
      return e.value;
    }).toList();
  }
  int get totalAmount {
    var totalAmount = 0;
    _cartItems.forEach((key, value) {
      totalAmount += value.price! * value.quantity!;
    });
    return totalAmount;
  }
}
