import 'package:get/get.dart';
import 'package:project_demo/data/respository/recommended_product_repo.dart';
import 'package:project_demo/models/products.dart';

class RecommendedProductController extends GetxController{
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});
  List<ProductModel> _recommendedProductList = [];
  List<ProductModel> get recommendedProductList => _recommendedProductList;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  Future<void> getRecommendedProductList() async {
    Response response = await recommendedProductRepo.getRecommendedProductList();
    if(response.statusCode == 200){
       print("getRecommendedProductList:OK");
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      _isLoading = true;
      // đây là hàm cập nhật lại giao diện
      update();
    }
    else {
      print("Error in getRecommendedProduct");
    }
  }




}