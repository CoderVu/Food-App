import 'package:get/get.dart';
import 'package:project_demo/controllers/cart_controller.dart';
import 'package:project_demo/controllers/popular_product_controller.dart';
import 'package:project_demo/controllers/recommended_product_controller.dart';
import 'package:project_demo/data/api/api_client.dart';
import 'package:project_demo/data/respository/cart_repo.dart';
import 'package:project_demo/data/respository/popular_product_repo.dart';
import 'package:project_demo/data/respository/recommended_product_repo.dart';
import 'package:project_demo/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance(); // để lưu trữ dữ liệu trong bộ nhớ cục bộ của thiết bị
  Get.lazyPut(() => sharedPreferences); // lưu trữ dữ liệu trong bộ nhớ cục bộ của thiết bị
  // api client
 Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));
 // respository
 Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
 Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
 Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
 // controller
 Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
 Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
 Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
// làm để gọi hàm init() ở main.dart để khởi tạo các controller, respository, api client
