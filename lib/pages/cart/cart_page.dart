import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project_demo/controllers/cart_controller.dart';
import 'package:project_demo/controllers/popular_product_controller.dart';
import 'package:project_demo/controllers/recommended_product_controller.dart';
import 'package:project_demo/pages/home/main_food_page.dart';
import 'package:project_demo/routers/router_helper.dart';
import 'package:project_demo/utils/app_constants.dart';
import 'package:project_demo/utils/colors.dart';
import 'package:project_demo/utils/dimensions.dart';
import 'package:project_demo/widgets/app_icon.dart';
import 'package:project_demo/widgets/big_text.dart';
import 'package:project_demo/widgets/small_text.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.height20*3,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back_outlined,
                backgroundColor: AppColors.mainColor,
                iconSize: Dimensions.iconSize24,
                iconColor: Colors.white,     
                ),
                SizedBox(width: Dimensions.width20*5,),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouterHelper.getInitial());
                  },
                  child: AppIcon(icon: Icons.home_outlined,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                  iconColor: Colors.white,     
                  ),
                ),
                AppIcon(icon: Icons.shopping_cart,
                backgroundColor: AppColors.mainColor,
                iconSize: Dimensions.iconSize24,
                iconColor: Colors.white,     
                )
              ],),
          ),
          Positioned(
            top: Dimensions.height20*5,
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height15),
              //color: Colors.red,
              child:MediaQuery.removePadding(
                context: context,
                removeTop: true, // loai bo padding top
                child: GetBuilder<CartController>(builder: (cartController){
                  var _cartList = cartController.cartItemsList;
                  return ListView.builder(
                  itemCount: _cartList.length,
                  itemBuilder: (_, index) {
                    return Container(
                      height: Dimensions.height20*5,
                      width: double.maxFinite,
                      child: Row(
                        children: [
                          // đây là một container chứa hình ảnh sản phẩm
                          GestureDetector(
                            onTap: () {
                             var popularIndex = Get.find<PopularProductController>().popularProductList.indexOf(_cartList[index].product!); // lấy ra index của sản phẩm trong danh sách sản phẩm phổ biến
                             if (popularIndex>=0){
                                Get.toNamed(RouterHelper.getPopularFood(popularIndex,"cartpage"));
                             }
                             else {
                              var recommendedIndex = Get.find<RecommendedProductController>().recommendedProductList.indexOf(_cartList[index].product!); // lấy ra index của sản phẩm trong danh sách sản phẩm đề xuất
                              Get.toNamed(RouterHelper.getRecommendedFood(recommendedIndex, "cartpage"));
                         
                             }
                            },
                            child: Container(
                              height: Dimensions.height20*5,
                              width: Dimensions.width20*5,
                              margin: EdgeInsets.only(bottom: Dimensions.height10,),
                              decoration: BoxDecoration(
                               image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    AppConstants.BASE_URL + AppConstants.UPLOAD_URL + cartController.cartItemsList[index].img!
                                )
                              
                               ),
                                borderRadius: BorderRadius.circular(Dimensions.radius20),
                                color: Colors.white
                            ),
                            ),
                          ),
                          SizedBox(width: Dimensions.width10,), // khoang cach giua 2 container
                          Expanded(
                            child: Container(
                              height: Dimensions.height20*5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // canh deu cac phan tu
                                children: [
                                  BigText(text: cartController.cartItemsList[index].name!,  color: Colors.black54,),
                                  SmallText(text: "Food Description",),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      BigText(text: cartController.cartItemsList[index].price!.toString(), color: Colors.redAccent,),
                                      // đây là một container chứa số lượng sản phẩm để tăng giảm số lượng
                                      Container(
                                        padding: EdgeInsets.only(top: Dimensions.height10, bottom: Dimensions.height10, left: Dimensions.width10, right: Dimensions.width10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                                        ),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                cartController.addItem(_cartList[index].product!, -1);
                                                print("Remove Item length: ${_cartList.length}");
                                              },
                                              child: Icon(Icons.remove, color: AppColors.signColor)),
                                            SizedBox(width: Dimensions.width10/2),
                                            BigText(text:_cartList[index].quantity.toString(),), 
                                            SizedBox(width: Dimensions.width10/2),
                                            GestureDetector(
                                              onTap: () {
                                               cartController.addItem(_cartList[index].product!, 1);
                                               print("Add Item length: ${_cartList.length}");
                                              },
                                              child: Icon(Icons.add, color: AppColors.signColor)),
                                          ],
                                        )
                                      
            ),
                                  
                                    ],
                                  )
                              ],),
                            ),
                          )
                      ],),
                         
                    );
                  },
                );
              })

              ),     
            ),
          ) 
        ],
      ),
       bottomNavigationBar: GetBuilder<CartController>(builder: (cartController) { // popularProductController
        
        return Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(top: Dimensions.height30, bottom: Dimensions.height30, left: Dimensions.width20, right: Dimensions.width20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.buttonBackgroundColor,
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20),
            topRight: Radius.circular(Dimensions.radius20),
          ),
        ),
        // show the bottom navigation bar content number of items
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // đây là một container chứa số lượng sản phẩm
            Container(
              padding: EdgeInsets.only(top: Dimensions.height15, bottom: Dimensions.height15, left: Dimensions.width20, right: Dimensions.width20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.radius20),
              ),
              child: Row(
                children: [
        
                  SizedBox(width: Dimensions.width10/2),
                  BigText(text:"\$ "+ cartController.totalAmount.toString(),),
                  SizedBox(width: Dimensions.width10/2),
               
                ],
              )
             
            ),
            GestureDetector(
               onTap: () {
                 cartController.addToCartHistoryList();
                },
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.height15, bottom: Dimensions.height15, left: Dimensions.width20, right: Dimensions.width20),
                       
                  child: BigText(text: "Check out", color: Colors.white,),
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                ),
              
              ),
            )
          ],
        ),
      );

      }),
    );
  }
}