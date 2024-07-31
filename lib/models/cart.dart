import 'package:project_demo/models/products.dart';

class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool? isExits;
  String? time;
  ProductModel? product;

  CartModel(
      {this.id,
      this.name,
      this.price,
      this.img,
      this.quantity,
      this.isExits,
      this.time,
      this.product});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    quantity = json['quantity'];
    isExits = json['isExits'];
    time = json['time'];
    product = json['product'] != null ? ProductModel.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['img'] = this.img;
    data['quantity'] = this.quantity;
    data['isExits'] = this.isExits;
    data['time'] = this.time;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}
