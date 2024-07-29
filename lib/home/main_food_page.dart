import 'package:flutter/material.dart';
import 'package:project_demo/utils/colors.dart';
import 'package:project_demo/widgets/big_text.dart';
import 'package:project_demo/widgets/small_text.dart';
import 'package:project_demo/home/food_page_body.dart';

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
          Container(
            margin: const EdgeInsets.only(top: 45, bottom: 15),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(text: "Việt Nam", color: AppColors.mainColor),
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
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(Icons.search, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const FoodPageBody(),
        ],
      ),
    );
  }
}