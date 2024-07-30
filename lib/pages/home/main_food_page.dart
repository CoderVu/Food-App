import 'package:flutter/material.dart';
import 'package:project_demo/utils/colors.dart';
import 'package:project_demo/widgets/big_text.dart';
import 'package:project_demo/widgets/small_text.dart';
import 'package:project_demo/pages/home/food_page_body.dart';
import 'package:project_demo/utils/dimensions.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Column(
        children: [
          // show the header title and search icon
          Container(
            margin: EdgeInsets.only(top: Dimensions.height40, bottom: Dimensions.height15),
            padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(text: "Việt Nam", color: AppColors.mainColor),
                    SizedBox(height: Dimensions.height10),
                    Row(
                      children: [
                        SmallText(text: "City", color: Colors.black54),
                        const Icon(Icons.arrow_drop_down_outlined, color: Colors.black54),
                      ],
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    width: Dimensions.height45,
                    height: Dimensions.height45,
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                    ),
                    child:  Icon(Icons.search, color: Colors.white, size: Dimensions.iconSize24),
                  ),
                ),
              ],
            ),
          ),
          // show the body of the page
         Expanded (
           child:SingleChildScrollView(
             child: FoodPageBody(),
           ),
         ),
        ],
      ),
    );
  }
}