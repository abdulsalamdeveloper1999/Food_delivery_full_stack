import 'package:flutter/material.dart';
import 'package:food_delivery_full_stack_app/controllers/popular_product_controller.dart';
import 'package:food_delivery_full_stack_app/controllers/recommended_food_controller.dart';
import 'package:food_delivery_full_stack_app/core/routes/routes_helper.dart';
import 'package:food_delivery_full_stack_app/core/utils/app_constants.dart';
import 'package:get/get.dart';

import '../../controllers/cart_controller.dart';
import '../../core/components/app_icon.dart';
import '../../core/components/big_text.dart';
import '../../core/components/expandable_text.dart';
import '../../core/components/small_text.dart';
import '../../core/utils/colors.dart';
import '../../core/utils/dimensions.dart';

class RecommendedFoodDetails extends StatelessWidget {
  int pageId;

  RecommendedFoodDetails({required this.pageId});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>()
        .initQuantity(product: product, cart: Get.find<CartController>());
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: GetBuilder<PopularProductController>(
          builder: (logic) {
            return Column(
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
                      GestureDetector(
                        onTap: () {
                          logic.setQuantity(false);
                        },
                        child: AppIcon(
                          icon: Icons.remove,
                          iconSize: Dimensions.iconSize24,
                          backgroundColor: AppColors.mainColor,
                          iconColor: Colors.white,
                        ),
                      ),
                      BigText(
                        text: '\$ ${product.price}  x  ${logic.inCartItems}',
                        color: AppColors.mainBlackColor,
                        size: Dimensions.font26,
                      ),
                      GestureDetector(
                        onTap: () {
                          logic.setQuantity(true);
                        },
                        child: AppIcon(
                          icon: Icons.add,
                          iconSize: Dimensions.iconSize24,
                          backgroundColor: AppColors.mainColor,
                          iconColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
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
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                        ),
                        child: Icon(
                          Icons.favorite,
                          color: AppColors.mainColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          logic.addItem(product);
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                            top: Dimensions.height20,
                            bottom: Dimensions.height20,
                            left: Dimensions.width20,
                            right: Dimensions.width20,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20),
                          ),
                          child: BigText(
                            text: '\$${product.price} | Add to cart',
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 70,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.initial);
                      },
                      child: AppIcon(icon: Icons.clear)),
                  GetBuilder<PopularProductController>(
                    builder: (popularC) {
                      return Stack(
                        children: [
                          AppIcon(
                            icon: Icons.shopping_cart_outlined,
                          ),
                          popularC.totalItems >= 1
                              ? Positioned(
                                  right: 0,
                                  top: 0,
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: AppColors.mainColor,
                                    child: SmallText(
                                      text: "${popularC.totalItems}",
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      );
                    },
                  )
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
                      text: product.name!,
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
                background: Image.network(
                  AppConstants.BASE_URL + AppConstants.UPLOADS + product.img!,
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
                      text: product.description!,
                    ),
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
