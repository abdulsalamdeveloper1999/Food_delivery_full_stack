import 'package:flutter/material.dart';
import 'package:food_delivery_full_stack_app/controllers/popular_product_controller.dart';
import 'package:food_delivery_full_stack_app/core/components/small_text.dart';
import 'package:food_delivery_full_stack_app/core/utils/app_constants.dart';
import 'package:get/get.dart';

import '../../controllers/cart_controller.dart';
import '../../core/components/app_column.dart';
import '../../core/components/app_icon.dart';
import '../../core/components/big_text.dart';
import '../../core/components/expandable_text.dart';
import '../../core/models/apiModel.dart';
import '../../core/routes/routes_helper.dart';
import '../../core/utils/colors.dart';
import '../../core/utils/dimensions.dart';

class PopularFoodDetails extends StatelessWidget {
  int pageId;

  PopularFoodDetails({required this.pageId});

  @override
  Widget build(BuildContext context) {
    ProductModel products =
        Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>()
        .initQuantity(product: products, cart: Get.find<CartController>());

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
                    image: NetworkImage(AppConstants.BASE_URL +
                        AppConstants.UPLOADS +
                        products.img!),
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
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: AppIcon(
                      icon: Icons.arrow_back_ios,
                    ),
                  ),
                  GetBuilder<PopularProductController>(
                    builder: (popularC) {
                      return Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                RouteHelper.getCartPage(pageId),
                              );
                            },
                            child: AppIcon(
                              icon: Icons.shopping_cart_outlined,
                            ),
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
                    AppColumn(text: products.name!),
                    SizedBox(height: Dimensions.height20),
                    BigText(text: 'Introduced'),
                    SizedBox(height: Dimensions.height20),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ExpandableTextWidget(
                          text: products.description!,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: GetBuilder<PopularProductController>(
          builder: (popular) {
            return Container(
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
                        GestureDetector(
                          onTap: () {
                            popular.setQuantity(false);
                          },
                          child: Icon(
                            Icons.remove,
                            color: AppColors.signColor,
                          ),
                        ),
                        SizedBox(width: Dimensions.width10 / 2),
                        BigText(text: popular.inCartItems.toString()),
                        SizedBox(width: Dimensions.width10 / 2),
                        GestureDetector(
                          onTap: () {
                            popular.setQuantity(true);
                          },
                          child: Icon(
                            Icons.add,
                            color: AppColors.signColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      popular.addItem(products);
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
                        text: '\$ ${products.price} | Add to cart',
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
