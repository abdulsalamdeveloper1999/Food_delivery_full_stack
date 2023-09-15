import 'package:food_delivery_full_stack_app/screens/cart/cart_page.dart';
import 'package:food_delivery_full_stack_app/screens/food/poplar_food_detail.dart';
import 'package:food_delivery_full_stack_app/screens/food/recommended_food_detail.dart';
import 'package:get/get.dart';

import '../../screens/home/main_food_page.dart';

class RouteHelper {
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static const String recommendedFood = '/recommended-food';
  static const String cartPage = '/cart-page';

  static String getPopular(int pageId) => '$popularFood?pageId=$pageId';
  static String getRecommended(int pageId) => '$recommendedFood?pageId=$pageId';
  static String getCartPage(int pageId) => '$cartPage?pageId=$pageId';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainFoodPage()),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        return PopularFoodDetails(
          pageId: int.parse(pageId!),
        );
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters['pageId'];

        return RecommendedFoodDetails(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: cartPage,
      page: () {
        var pageId = Get.parameters['pageId'];

        return CartPage(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn,
    ),
  ];
}
