import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:project_demo/utils/colors.dart';
import 'package:project_demo/utils/dimensions.dart';
import 'package:project_demo/widgets/app_column.dart';
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
  double _height = Dimensions.pageViewContainer;
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
    return Column(
      children: [
      // show the header title and search icon
        Container(
          // color: Colors.redAccent,
          height: Dimensions.pageView,
          child: PageView.builder(
            controller: _pageController,
            itemCount: 5,
            itemBuilder: (context, position) {
              return _buildPageItem(position);
            },
          ),
        ),
      //  show the dots indicator
        new DotsIndicator(
          dotsCount: 5,
          position: currentPageValue,
          decorator: DotsDecorator(
            color: Colors.black26,
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
      // Popular text
      SizedBox(height: Dimensions.height30),
      Container(
        margin: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30),
        child: Row(
          
          children: [
            BigText(text: "Popular", color: Colors.black26, ),
            SizedBox(width: Dimensions.width10),
            Container(
              margin: const EdgeInsets.only(bottom: 2),
              child: BigText(text: ".",color: Colors.black26,),
            ),
            SizedBox(width: Dimensions.width10,),
            Container(
              child: SmallText(text: "Food pairing",color:Colors.black26,),
            ),
          ],
        ),
      ),
      // list of popular food and image
        ListView.builder(
         physics: NeverScrollableScrollPhysics(),
         shrinkWrap: true , // chieu cao cua listview bang chieu cao cua cac item
         itemCount: 10,
         itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.height10, top: Dimensions.height10),
            child: Row(
              children: [
                // image section
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white38,
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/image/food0.png"),
                    ),
                  ),
                ),
                // text container
                Expanded(
                  child: Container(
                    height: Dimensions.listViewTextContSize,
                                
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.radius20),
                        bottomRight: Radius.circular(Dimensions.radius20),
                  
                      ),
                      color: Colors.white,
                    ),
                  child: Padding(
                    padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // canh trai
                      mainAxisAlignment: MainAxisAlignment.center, // canh giua hinh
                      children: [
                        BigText(text: "Nutritious fruit meal in Viet Nam"),
                        SizedBox(height: Dimensions.height10,),
                        SmallText(text: "With the best quality", color: Colors.black26),
                        SizedBox(height: Dimensions.height10,),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween, // canh giua
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
                )

              ],),
          );
        
         }
         ),
    
      
      ],
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
          height: Dimensions.pageViewContainer,
          margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius30),
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
            margin: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30, bottom: Dimensions.height30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFe8e8e8),
                  blurRadius: 10.0,
                  offset: const Offset(0, 5),
                ),
                BoxShadow(
                  color: const Color(0xFFe8e8e8),
                  offset: const Offset(-5, 0),
                ),
                  BoxShadow(
                  color: const Color(0xFFe8e8e8),
                  offset: const Offset(5, 0),
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.only(top: Dimensions.height15, left: 15, right: 15),
              child: AppColumn(text: "Chinese Side"),    
            ),
          ),
        ),
      ],
    ),
  );
}
}