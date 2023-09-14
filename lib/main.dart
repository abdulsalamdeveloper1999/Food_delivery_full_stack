import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/food/recommended_food_detail.dart';

void main() {
  runApp(const MyMain());
}

class MyMain extends StatelessWidget {
  const MyMain({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: MainFoodPage(),
      // home: PopularFoodDetails(),
      home: RecommendedFoodDetails(),
    );
  }
}
