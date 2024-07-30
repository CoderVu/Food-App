import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_demo/controllers/popular_product_controller.dart';
import 'package:project_demo/controllers/recommended_product_controller.dart';
import 'package:project_demo/routers/router_helper.dart';
import 'package:project_demo/utils/app_constants.dart';
import 'package:project_demo/utils/colors.dart';
import 'package:project_demo/utils/dimensions.dart';
import 'package:project_demo/widgets/app_icon.dart';
import 'package:project_demo/widgets/big_text.dart';
import 'package:project_demo/widgets/expandable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;
   const RecommendedFoodDetail({Key? key, required this.pageId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedProductController>().recommendedProductList[pageId];
    return Scaffold(
      backgroundColor: Colors.white,
      // đây là một CustomScrollView, nó cho phép bạn tạo một màn hình cuộn tùy chỉnh
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false, 
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
              children: [
                GestureDetector(
                  onTap: (){
                    // quay lại trang chủ
                    Get.toNamed(RouterHelper.getInitial());
                  },
                  child: AppIcon(icon: Icons.clear)),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  ),
                ),
                child: Center(
                  child: BigText(
                    size: Dimensions.font26,
                    text: product.name!,
                  ),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                   child: ExpandableTextWidget(
                    text: product.description!,
                   ),
                   margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20,),
                )
             
              ],
             
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,

        children: [
          // đây là một container chứa số lượng sản phẩm
          Container(
            padding: EdgeInsets.only(top: Dimensions.height10 , bottom: Dimensions.height15, left: Dimensions.width20*2.5, right: Dimensions.width20*2.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon( 
                  size: 45,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  icon: Icons.remove),
                  BigText(text: "\VNĐ ${product.price!}  X  0", color: AppColors.mainBlackColor, size: Dimensions.font26,),
                AppIcon(
                  size: 45,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  icon: Icons.add),
              ],
            ),
          ),
          // đây là một container chứa nút Add to Cart
          Container(
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
              child: Icon(Icons.favorite, color: AppColors.mainColor,),
             
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
        ],),
    );
  }
}
