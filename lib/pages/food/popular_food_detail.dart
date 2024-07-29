import 'package:flutter/material.dart';
import 'package:project_demo/utils/colors.dart';
import 'package:project_demo/utils/dimensions.dart';
import 'package:project_demo/widgets/app_column.dart';
import 'package:project_demo/widgets/app_icon.dart';
import 'package:project_demo/widgets/big_text.dart';
import 'package:project_demo/widgets/expandable_text_widget.dart';
import 'package:project_demo/widgets/icon_and_text_widget.dart';
import 'package:project_demo/widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
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
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image/food0.png'),
                  fit: BoxFit.cover,
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
                AppIcon(icon: Icons.arrow_back_ios),
                AppIcon(icon: Icons.shopping_cart_outlined),
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
                  AppColumn(text: "Chinese Side",),
                  SizedBox(height: Dimensions.height20),
                  BigText(text: "Introduction"),
                  Expanded (child: SingleChildScrollView (child: ExpandableTextWidget(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet.ulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Duis sagittis ipsum. Praesent mauris.Nulla quis sem at nibh elementum imperdiet.ulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Duis sagittis ipsum. Praesent mauris."))),
                ],
              ),
            ),
          ),
          // expandable text widget

        ],
      ),
      // show the bottom navigation bar
      bottomNavigationBar: Container(
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
                  Icon(Icons.remove, color: AppColors.signColor),
                  SizedBox(width: Dimensions.width10/2),
                  BigText(text: "0",),
                  SizedBox(width: Dimensions.width10/2),
                  Icon(Icons.add, color: AppColors.signColor),
                ],
              )
             
            ),
            Container(
              padding: EdgeInsets.only(top: Dimensions.height15, bottom: Dimensions.height15, left: Dimensions.width20, right: Dimensions.width20),
              child: BigText(text: "\$10 | Add to Cart", color: Colors.white,),
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(Dimensions.radius20),
              ),

            )
          ],
        ),
      ),
    );
  }
}