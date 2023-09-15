import 'package:food_delivery_full_stack_app/controllers/cart_controller.dart';
import 'package:food_delivery_full_stack_app/core/utils/app_constants.dart';
import 'package:food_delivery_full_stack_app/data/api/api_client.dart';
import 'package:food_delivery_full_stack_app/data/repository/cart_repo.dart';
import 'package:food_delivery_full_stack_app/data/repository/popular_product_repo.dart';
import 'package:food_delivery_full_stack_app/data/repository/recommended_product_repo.dart';
import 'package:get/get.dart';

import '../controllers/popular_product_controller.dart';
import '../controllers/recommended_food_controller.dart';

Future<void> init() async {
  ///apiClient
  Get.lazyPut(
    () => ApiClient(appBaseUrl: AppConstants.BASE_URL),
  );

  ///Repository
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());

  ///Controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
