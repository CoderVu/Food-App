import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_demo/utils/colors.dart';
import 'package:project_demo/utils/dimensions.dart';
import 'package:project_demo/widgets/big_text.dart';
import 'package:project_demo/widgets/icon_and_text_widget.dart';
import 'package:project_demo/widgets/small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
          BigText(text: text, size: Dimensions.font26),
          SizedBox(height: Dimensions.height10),
          Row(
            children: [
              Wrap(
                children: List.generate(5, (index) {
                  return Icon(Icons.star, color: AppColors.mainColor, size: Dimensions.iconSize16);
                }),
              ),
              SizedBox(width: Dimensions.width10),
              SmallText(text: "4.5", color: Colors.black54),
              SizedBox(width: Dimensions.width10),
              SmallText(text: "10000", color: Colors.black54),
              SizedBox(width: Dimensions.width10),
              SmallText(text: "đánh giá", color: Colors.black54),
            ],
          ),
          SizedBox(height: Dimensions.height15),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
           
            children: [
              IconAndTextWidget(
                text: "Normal",
                icon: Icons.circle_sharp,
                iconColor: AppColors.iconColor1,
              ),
              IconAndTextWidget(
                text: "1.7km",
                icon: Icons.location_on,
                iconColor: AppColors.mainColor,
              ),
              IconAndTextWidget(
                text: "32min",
                icon: Icons.access_time_filled_rounded,
                iconColor: AppColors.iconColor2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}