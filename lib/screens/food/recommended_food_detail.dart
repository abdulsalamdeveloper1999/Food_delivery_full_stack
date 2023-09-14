import 'package:flutter/material.dart';
import 'package:food_delivery_full_stack_app/components/app_icon.dart';
import 'package:food_delivery_full_stack_app/components/big_text.dart';
import 'package:food_delivery_full_stack_app/components/expandable_text.dart';
import 'package:food_delivery_full_stack_app/utils/colors.dart';
import 'package:food_delivery_full_stack_app/utils/dimensions.dart';

class RecommendedFoodDetails extends StatelessWidget {
  const RecommendedFoodDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: Dimensions.width20 * 2.5,
                right: Dimensions.width20 * 2.5,
                top: Dimensions.height10,
                bottom: Dimensions.height10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                    icon: Icons.remove,
                    iconSize: Dimensions.iconSize24,
                    backgroundColor: AppColors.mainColor,
                    iconColor: Colors.white,
                  ),
                  BigText(
                    text: '\$12.88 x 0',
                    color: AppColors.mainBlackColor,
                    size: Dimensions.font26,
                  ),
                  AppIcon(
                    icon: Icons.add,
                    iconSize: Dimensions.iconSize24,
                    backgroundColor: AppColors.mainColor,
                    iconColor: Colors.white,
                  ),
                ],
              ),
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              toolbarHeight: 70,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.clear),
                  AppIcon(icon: Icons.shopping_cart_outlined),
                ],
              ),
              bottom: PreferredSize(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.radius20),
                      topLeft: Radius.circular(Dimensions.radius20),
                    ),
                  ),
                  padding: EdgeInsets.only(top: 5, bottom: 10),
                  width: double.maxFinite,
                  child: Center(
                    child: BigText(
                      text: 'Chinese Side',
                      size: Dimensions.font26,
                    ),
                  ),
                ),
                preferredSize: Size.fromHeight(50),
              ),
              backgroundColor: AppColors.yellowColor,
              pinned: true,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/image/food0.png',
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: Dimensions.width20, right: Dimensions.width20),
                    child: ExpandableTextWidget(
                        text:
                            'Indulge in the tantalizing flavors of Chinese cuisine with our savory Kung Pao Chicken. This classic Sichuan dish features tender chunks of succulent chicken stir-fried to perfection with roasted peanuts, vibrant bell peppers, and scallions. The real magic happens with our secret Kung Pao sauce, a harmonious blend of soy sauce, vinegar, sugar, and a touch of heat from dried red chilies. Each bite is an explosion of sweet, tangy, and spicy sensations that dance on your taste buds, leaving you craving for more. Served over a bed of steaming white rice, our Kung Pao Chicken is a culinary adventure you won\'t want to miss Indulge in the tantalizing flavors of Chinese cuisine with our savory Kung Pao Chicken. This classic Sichuan dish features tender chunks of succulent chicken stir-fried to perfection with roasted peanuts, vibrant bell peppers, and scallions. The real magic happens with our secret Kung Pao sauce, a harmonious blend of soy sauce, vinegar, sugar, and a touch of heat from dried red chilies. Each bite is an explosion of sweet, tangy, and spicy sensations that dance on your taste buds, leaving you craving for more. Served over a bed of steaming white rice, our Kung Pao Chicken is a culinary adventure you won\'t want to miss Indulge in the tantalizing flavors of Chinese cuisine with our savory Kung Pao Chicken. This classic Sichuan dish features tender chunks of succulent chicken stir-fried to perfection with roasted peanuts, vibrant bell peppers, and scallions. The real magic happens with our secret Kung Pao sauce, a harmonious blend of soy sauce, vinegar, sugar, and a touch of heat from dried red chilies. Each bite is an explosion of sweet, tangy, and spicy sensations that dance on your taste buds, leaving you craving for more. Served over a bed of steaming white rice, our Kung Pao Chicken is a culinary adventure you won\'t want to miss'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
