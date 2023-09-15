import 'package:flutter/material.dart';
import 'package:food_delivery_full_stack_app/controllers/recommended_food_controller.dart';
import 'package:get/get.dart';

import 'controllers/popular_product_controller.dart';
import 'core/routes/routes_helper.dart';
import 'helper/dependencies.dart' as dep;
import 'screens/home/main_food_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await dep.init();
    runApp(const MyMain());
  } catch (error) {
    print('Error during app initialization: $error');
  }
}

class MyMain extends StatelessWidget {
  const MyMain({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularList();
    Get.find<RecommendedProductController>().getRecommendedList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery',
      initialRoute: RouteHelper.initial,
      // home: CartPage(),
      home: MainFoodPage(),
      getPages: RouteHelper.routes,
    );
  }
}
