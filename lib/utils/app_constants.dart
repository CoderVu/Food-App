class AppConstants {
  static const String APP_NAME = "DBFood";
  static const int APP_VERSION = 1;

  static const String BASE_URL = "http://172.20.10.5:8080";

  static const String POPULAR_PRODUCT_URL = "/api/v1/products/popular"; // đây là đường dẫn API để lấy dữ liệu sản phẩm phổ biến

  static const String RECOMMENDED_PRODUCT_URL = "/api/v1/products/recommended";  // đây là đường dẫn API để lấy dữ liệu sản phẩm được đề xuất
  static const String TOKEN = "DBtoken";
  static const String UPLOAD_URL = "/api/v1/uploads/"; // đây là đường dẫn API để upload file
  static const String CART_LIST = "cart-list";
  static const String CART_HISTOTY_LIST = "cart-history-list";
}