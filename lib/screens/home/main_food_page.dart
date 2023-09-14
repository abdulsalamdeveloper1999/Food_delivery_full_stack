import 'package:flutter/material.dart';
import 'package:food_delivery_full_stack_app/components/big_text.dart';
import 'package:food_delivery_full_stack_app/components/small_text.dart';
import 'package:food_delivery_full_stack_app/utils/colors.dart';
import 'package:food_delivery_full_stack_app/utils/dimensions.dart';

import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ///Header
            Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height45, bottom: Dimensions.height15),
              padding: EdgeInsets.only(
                  left: Dimensions.width20, right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              BigText(
                                text: 'Pakistan',
                                color: AppColors.mainColor,
                                size: 30,
                              ),
                              Row(
                                children: [
                                  SmallText(
                                    text: 'Islamabad',
                                    color: Colors.black54,
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    size: Dimensions.iconSize24,
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                    ),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    height: Dimensions.height45,
                    width: Dimensions.width45,
                  )
                ],
              ),
            ),

            ///Showing Body
            const Expanded(child: SingleChildScrollView(child: FoodPageBody())),
          ],
        ),
      ),
    );
  }
}
