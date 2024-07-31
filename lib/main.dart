import 'package:flutter/material.dart';
import 'package:project_demo/controllers/cart_controller.dart';
import 'package:project_demo/controllers/popular_product_controller.dart';
import 'package:project_demo/controllers/recommended_product_controller.dart';
import 'package:project_demo/pages/cart/cart_page.dart';
import 'package:project_demo/pages/food/recommended_food_detail.dart';
import 'package:project_demo/pages/home/food_page_body.dart';
import 'package:project_demo/pages/home/main_food_page.dart';
import 'package:get/get.dart';
import 'package:project_demo/pages/food/popular_food_detail.dart';
import 'package:project_demo/helper/dependencies.dart' as dep;
import 'package:project_demo/routers/router_helper.dart';
import 'package:project_demo/splash/splash_page.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    Get.find<CartController>().getCartData();
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: PopularFoodDetail(),
      //  home: MainFoodPage(),
       initialRoute: RouterHelper.getSplash(),
       getPages: RouterHelper.routers,
      // home : RecommendedFoodDetail(),
      // home: FoodPageBody(),
      // home: CartPage(),
     // home: SplashScreen(),
    );
  }
}
