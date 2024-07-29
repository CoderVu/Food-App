import 'package:flutter/material.dart';
import 'package:project_demo/utils/colors.dart';
import 'package:project_demo/utils/dimensions.dart';
import 'package:project_demo/widgets/app_icon.dart';
import 'package:project_demo/widgets/big_text.dart';
import 'package:project_demo/widgets/expandable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // đây là một CustomScrollView, nó cho phép bạn tạo một màn hình cuộn tùy chỉnh
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
              children: [
                AppIcon(icon: Icons.clear),
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
                    text: "Chinese Side",
                  ),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/image/food0.png',
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                   child: ExpandableTextWidget( text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. "
                    "Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at "
                    "nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec "
                    "tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget "
                    "nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, "
                    "per inceptos himenaeos. Curabitur sodales ligula in libero. Sed dignissim "
                    "lacinia nunc. Curabitur tortor. Pellentesque nibh. Aenean quam. In "
                    "scelerisque sem at dolor. Maecenas mattis. Sed convallis tristique sem. "
                    "Proin ut ligula vel nunc egestas porttitor. Morbi lectus risus, iaculis vel, "
                    "suscipit quis, luctus non, massa. Fusce ac turpis quis ligula lacinia aliquet. "
                    "Mauris ipsum. Nulla metus metus, ullamcorper vel, tincidunt sed, euismod in, "
                    "nibh. Quisque volutpat condimentum velit. Class aptent taciti sociosqu ad "
                    "litora torquent per conubia nostra, per inceptos himenaeos. Nam nec ante. "
                    "Sed lacinia, urna non tincidunt mattis, tortor neque adipiscing diam, a "
                    "cursus ipsum ante quis turpis. Nulla facilisi. Ut fringilla. Suspendisse "
                    "potenti. Nunc feugiat mi a tellus consequat imperdiet. Vestibulum sapien. "
                    "Proin quam. Etiam ultrices. Suspendisse in justo eu magna luctus suscipit. "
                    "Sed lectus. Integer euismod lacus luctus magna. Quisque cursus, metus vitae "
                    "pharetra auctor, sem massa mattis sem, at interdum magna augue eget diam. "
                    "Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere "
                    "cubilia Curae; Morbi lacinia molestie dui. Praesent blandit dolor. Sed non "
                    "quam. In vel mi sit amet augue congue elementum. Morbi in ipsum sit amet pede "
                    "facilisis laoreet. Donec lacus nunc, viverra nec, blandit vel, egestas et, "
                    "augue. Vestibulum tincidunt malesuada tellus. Ut ultrices ultrices enim. "
                    "Curabitur sit amet mauris. Morbi in dui quis est pulvinar ullamcorper. "
                    "Nulla facilisi. Integer lacinia sollicitudin massa. Cras metus. Sed aliquet "
                    "risus a tortor. Integer id quam. Morbi mi. Quisque nisl felis, venenatis "
                    "tristique, dignissim in, ultrices sit amet, augue. Proin sodales libero eget "
                    "ante. Nulla quam. Aenean laoreet. Vestibulum nisi lectus, commodo ac, "
                    "facilisis ac, ultricies eu, pede. Ut orci risus, accumsan porttitor, cursus "
                    "quis, aliquet eget, justo. Sed pretium blandit orci. Ut eu diam at pede "
                    "suscipit sodales. Aenean lectus elit, fermentum non, convallis id, sagittis "
                    "at, neque. Nullam mauris orci, aliquet et, iaculis et, viverra vitae, ligula. "
                    "Nulla ut felis in purus aliquam imperdiet. Maecenas aliquet mollis lectus. "
                    "Vivamus consectetuer risus et tortor. Lorem ipsum dolor sit amet, consectetur "
                    "adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus "
                    "diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis "
                    "ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris "
                    "massa. Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad "
                    "litora torquent per conubia nostra, per inceptos himenaeos.",
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
                  BigText(text: "\$12.88 " + "X" + " 0", color: AppColors.mainBlackColor, size: Dimensions.font26,),
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
