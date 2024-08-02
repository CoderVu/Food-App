import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_demo/controllers/cart_controller.dart';
import 'package:project_demo/models/cart.dart';
import 'package:project_demo/utils/app_constants.dart';
import 'package:project_demo/utils/colors.dart';
import 'package:project_demo/utils/dimensions.dart';
import 'package:project_demo/widgets/big_text.dart';
import 'package:intl/intl.dart';
import 'package:collection/collection.dart';

class HistoryOrderPage extends StatelessWidget {
  const HistoryOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BigText(text: "Order History"),
        backgroundColor: AppColors.mainColor,
      ),
      body: GetBuilder<CartController>(builder: (cartController) {
        var historyList = cartController.getCartHistoryData();

        // Group the history list by order time
        var groupedOrders = groupBy(historyList, (CartModel order) => order.time);

        return ListView(
          children: groupedOrders.entries.map((entry) {
            var orderTime = DateFormat('dd-MM-yyyy HH:mm a').format(DateTime.parse(entry.key!));
            var orders = entry.value;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: Dimensions.height5, // Giảm khoảng cách theo chiều dọc
                    horizontal: Dimensions.width20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(text: "$orderTime"),
                      SizedBox(height: Dimensions.height5), // Thêm khoảng cách nhỏ giữa thời gian và nút Reorder
                      GestureDetector(
                        onTap: () {
                          // Gọi phương thức reorder với tất cả sản phẩm trong đơn hàng
                          cartController.reorder(orders);
                        },
                        child: ButtonBar(
                          children: [
                            Icon(Icons.replay, color: AppColors.mainColor),
                            BigText(text: "Reorder", color: AppColors.mainColor),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ...orders.map((order) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                      vertical: Dimensions.height5, // Giảm khoảng cách giữa các mục
                      horizontal: Dimensions.width20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 5,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: Dimensions.width20 * 5,
                          height: Dimensions.height20 * 5,
                          margin: EdgeInsets.all(Dimensions.height10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius20),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                AppConstants.BASE_URL +
                                    AppConstants.UPLOAD_URL +
                                    order.img!,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: Dimensions.width10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BigText(text: order.name!, color: Colors.black54),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  BigText(text: "\$${order.price!.toString()}", color: Colors.redAccent),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: BigText(text: "Số lượng: ${order.quantity.toString()}"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ],
            );
          }).toList(),
        );
      }),
    );
  }
}
