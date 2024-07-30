import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:project_demo/controllers/cart_controller.dart';
import 'package:project_demo/controllers/popular_product_controller.dart';
import 'package:project_demo/pages/home/main_food_page.dart';
import 'package:project_demo/utils/app_constants.dart';
import 'package:project_demo/utils/colors.dart';
import 'package:project_demo/utils/dimensions.dart';
import 'package:project_demo/widgets/app_column.dart';
import 'package:project_demo/widgets/app_icon.dart';
import 'package:project_demo/widgets/big_text.dart';
import 'package:project_demo/widgets/expandable_text_widget.dart';
import 'package:project_demo/widgets/icon_and_text_widget.dart';
import 'package:project_demo/widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  int pageId;
  PopularFoodDetail({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct(Get.find<CartController>(), product);
    print("page is id " + pageId.toString());
    print("product name is " + product.name.toString());
    
    return Scaffold(
      body: Stack(
        children: [
          // background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration:  BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                   image: NetworkImage(
                               AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.img!
                       )
                ),
              ),
            ),
          ),
          // show the back and shopping cart icon
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // show the back icon and quay lại trang trước
                GestureDetector(
                  onTap: () {
                    Get.to(() => MainFoodPage());
                  },
                  child: AppIcon(icon: Icons.arrow_back_ios),
                ),
               GetBuilder<PopularProductController>(builder: (controller) {
                return Stack(
                  children: [
                     AppIcon(icon: Icons.shopping_cart_outlined),
                    Get.find<PopularProductController>().totalItems>=1? 
                     Positioned(
                      right: 0, 
                      top: 0,
                      child: AppIcon(icon: Icons.circle, 
                      size: 20, 
                      iconColor: Colors.transparent, 
                      backgroundColor: AppColors.mainColor ,),
                     ):
                      Container(),
                    Get.find<PopularProductController>().totalItems>=1? 
                     Positioned(
                      right: 3, 
                      top: 3,
                      child: BigText(text: Get.find<PopularProductController>().totalItems.toString(),
                      size: 12,
                      color: Colors.white,),
                     ):
                      Container(),
                  ],
                );
               } ,)
              ],
            ),
          ),
          // introduce the text of the page
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImgSize - Dimensions.height20,
            child: Container(
              padding: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                top: Dimensions.height20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20),
                  topRight: Radius.circular(Dimensions.radius20),
                ),
              ),
              // show the text of the page
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: product.name!,),
                  SizedBox(height: Dimensions.height20),
                  BigText(text: "Introduction"),
                  Expanded (child: SingleChildScrollView (child: ExpandableTextWidget(text: product.description!))),
                ],
              ),
            ),
          ),
          // expandable text widget

        ],
      ),
      // show the bottom navigation bar
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProduct) { // popularProductController
        
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
                  GestureDetector(
                    onTap: () {
                      popularProduct.setQuantity(false);
                    },
                    child: Icon(Icons.remove, color: AppColors.signColor)),
                  SizedBox(width: Dimensions.width10/2),
                  BigText(text: popularProduct.inCartItems.toString(),),
                  SizedBox(width: Dimensions.width10/2),
                  GestureDetector(
                    onTap: () {
                      popularProduct.setQuantity(true);
                    },
                    child: Icon(Icons.add, color: AppColors.signColor)),
                ],
              )
             
            ),
            Container(
              padding: EdgeInsets.only(top: Dimensions.height15, bottom: Dimensions.height15, left: Dimensions.width20, right: Dimensions.width20),
              child: GestureDetector(
                onTap: () {
                  Get.find<PopularProductController>().addItemToCart(product);
                },
                child: BigText(text: "\VNĐ ${product.price} | Add to Cart", color: Colors.white,)),
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(Dimensions.radius20),
              ),

            )
          ],
        ),
      );

      }),
    );
  }
}
