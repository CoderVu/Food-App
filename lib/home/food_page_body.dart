import 'package:flutter/material.dart';
import 'package:project_demo/utils/colors.dart';
import 'package:project_demo/widgets/big_text.dart';
import 'package:project_demo/widgets/icon_and_text_widget.dart';
import 'package:project_demo/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController _pageController = PageController(viewportFraction: 0.85);
  var currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = 220;
  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentPageValue = _pageController.page!;
  
      });
    });
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.redAccent,
      height: 320,
      child: PageView.builder(
        controller: _pageController,
        itemCount: 5,
        itemBuilder: (context, position) {
          return _buildPageItem(position);
        },
      ),
    );
  }
  // Hieu ung thu nho va dich chuyen
Widget _buildPageItem(int index) {
  Matrix4 matrix = Matrix4.identity();
  double currScale = _scaleFactor;
  double currTrans = _height * (1 - currScale) / 2;

  if (index == currentPageValue.floor()) {
    currScale = 1 - (currentPageValue - index).abs() * (1 - _scaleFactor);
    currTrans = _height * (1 - currScale) / 2;
  } else if (index == currentPageValue.floor() + 1) {
    currScale = _scaleFactor + (currentPageValue - index + 1).abs() * (1 - _scaleFactor);
    currTrans = _height * (1 - currScale) / 2;
  } else if (index == currentPageValue.floor() - 1) {
    currScale = _scaleFactor + (currentPageValue - index).abs() * (1 - _scaleFactor);
    currTrans = _height * (1 - currScale) / 2;
  }
  
  matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

  return Transform(
    transform: matrix,
    child: Stack(
      children: [
        Container(
          height: _height,
          margin: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: index.isEven ? const Color(0xFF69c5df) : const Color(0xFF9294cc),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/image/food0.png"),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 120,
            margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFe8e8e8),
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "Cơm gà"),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(5, (index) {
                          return Icon(Icons.star, color: AppColors.mainColor, size: 15);
                        }),
                      ),
                      const SizedBox(width: 10),
                      SmallText(text: "4.5", color: Colors.black54),
                      const SizedBox(width: 10),
                      SmallText(text: "1000", color: Colors.black54),
                      const SizedBox(width: 10),
                      SmallText(text: "đánh giá", color: Colors.black54),
                    ],
                  ),
                  const SizedBox(height: 20),
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
            ),
          ),
        ),
      ],
    ),
  );
}
}