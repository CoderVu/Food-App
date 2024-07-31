import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project_demo/controllers/cart_controller.dart';
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
                  return ListView.builder(
                  itemCount: cartController.cartItems.length,
                  itemBuilder: (_, index) {
                    return Container(
                      height: Dimensions.height20*5,
                      width: double.maxFinite,
                      child: Row(
                        children: [
                          Container(
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
                                              // popularProduct.setQuantity(false);
                                              },
                                              child: Icon(Icons.remove, color: AppColors.signColor)),
                                            SizedBox(width: Dimensions.width10/2),
                                            BigText(text:"0"), // popularProduct.inCartItems.toString(),),
                                            SizedBox(width: Dimensions.width10/2),
                                            GestureDetector(
                                              onTap: () {
                                              // popularProduct.setQuantity(true);
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
    );
  }
}