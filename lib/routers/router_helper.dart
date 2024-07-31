import 'package:get/get.dart';
import 'package:project_demo/pages/cart/cart_page.dart';
import 'package:project_demo/pages/food/popular_food_detail.dart';
import 'package:project_demo/pages/food/recommended_food_detail.dart';
import 'package:project_demo/pages/history/history_oder_page.dart';
import 'package:project_demo/pages/home/home_page.dart';
import 'package:project_demo/pages/home/main_food_page.dart';
import 'package:project_demo/splash/splash_page.dart';

class RouterHelper {
  static const String splash = '/splash';
  static const String initial = '/';
  static const String popularFood = "/popular-food";
  static const String recommendedFood  = "/recommended-food";
  static const String cart = "/cart-page";
  static const String cart_history = "/history-order-page";

  static String getSplash() => '$splash';
  static String getInitial() => '$initial';
  static String getPopularFood(int pageId, String page) => '$popularFood?pageId=$pageId&page=$page'; 
  static String getRecommendedFood(int pageId, String page) => '$recommendedFood?pageId=$pageId&page=$page'; 
  static String getCart() => '$cart';
  static String getHistoryOrderPage() => '$cart_history';

  static List<GetPage> routers = [
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: initial, page: () => HomePage()),
    GetPage(
      name: popularFood, 
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return PopularFoodDetail(pageId:int.parse(pageId!), page: page!);
      },
      transition: Transition.fadeIn 
    ),
    GetPage(
      name: recommendedFood, 
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return RecommendedFoodDetail(pageId:int.parse(pageId!),page: page!);
      },
      transition: Transition.fadeIn 
    ),
    GetPage(
      name: cart, 
      page: () => CartPage(),
      transition: Transition.fadeIn 
    ),
    GetPage(
      name: cart_history, 
      page: () => HistoryOrderPage(),
      transition: Transition.fadeIn 
    ),
  ];
}