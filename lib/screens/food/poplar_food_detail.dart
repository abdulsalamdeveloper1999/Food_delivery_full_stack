import 'package:flutter/material.dart';
import 'package:food_delivery_full_stack_app/components/app_column.dart';
import 'package:food_delivery_full_stack_app/components/app_icon.dart';
import 'package:food_delivery_full_stack_app/components/big_text.dart';
import 'package:food_delivery_full_stack_app/components/expandable_text.dart';
import 'package:food_delivery_full_stack_app/utils/colors.dart';
import 'package:food_delivery_full_stack_app/utils/dimensions.dart';

class PopularFoodDetails extends StatelessWidget {
  const PopularFoodDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            ///background Image
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImgSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/image/food0.png'),
                  ),
                ),
              ),
            ),

            ///Top Two icons
            Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                    icon: Icons.arrow_back_ios,
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart_outlined,
                  ),
                ],
              ),
            ),

            ///Introduction Info
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularFoodImgSize - 20,
              child: Container(
                padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  top: Dimensions.height20,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: 'Chinese Side'),
                    SizedBox(height: Dimensions.height20),
                    BigText(text: 'Introduced'),
                    SizedBox(height: Dimensions.height20),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ExpandableTextWidget(
                          text:
                              'Indulge in the tantalizing flavors of Chinese cuisine with our savory Kung Pao Chicken. This classic Sichuan dish features tender chunks of succulent chicken stir-fried to perfection with roasted peanuts, vibrant bell peppers, and scallions. The real magic happens with our secret Kung Pao sauce, a harmonious blend of soy sauce, vinegar, sugar, and a touch of heat from dried red chilies. Each bite is an explosion of sweet, tangy, and spicy sensations that dance on your taste buds, leaving you craving for more. Served over a bed of steaming white rice, our Kung Pao Chicken is a culinary adventure you won\'t want to miss.',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: Dimensions.height120 * 1.23,
          padding: EdgeInsets.only(
            top: Dimensions.height30,
            bottom: Dimensions.height30,
            left: Dimensions.width20,
            right: Dimensions.width20,
          ),
          decoration: BoxDecoration(
            color: AppColors.buttonBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius20 * 2),
              topRight: Radius.circular(Dimensions.radius20 * 2),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: Dimensions.height20,
                  bottom: Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.remove,
                      color: AppColors.signColor,
                    ),
                    SizedBox(width: Dimensions.width10 / 2),
                    BigText(text: '0'),
                    SizedBox(width: Dimensions.width10 / 2),
                    Icon(
                      Icons.add,
                      color: AppColors.signColor,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: Dimensions.height20,
                  bottom: Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                ),
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                ),
                child: BigText(
                  text: '\$10 | Add to cart',
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
