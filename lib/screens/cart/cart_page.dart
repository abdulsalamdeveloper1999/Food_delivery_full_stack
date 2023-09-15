import 'package:flutter/material.dart';
import 'package:food_delivery_full_stack_app/controllers/cart_controller.dart';
import 'package:food_delivery_full_stack_app/core/components/app_icon.dart';
import 'package:food_delivery_full_stack_app/core/components/small_text.dart';
import 'package:food_delivery_full_stack_app/core/utils/app_constants.dart';
import 'package:food_delivery_full_stack_app/core/utils/colors.dart';
import 'package:food_delivery_full_stack_app/core/utils/dimensions.dart';
import 'package:get/get.dart';

import '../../core/components/big_text.dart';

class CartPage extends StatelessWidget {
  int pageId;
  CartPage({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    print(pageId);
    return SafeArea(
      child: Scaffold(
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
                child: BigText(text: '\$ 139'),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
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
                    text: 'Check Out',
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
        body: Stack(
          children: [
            Positioned(
              left: Dimensions.width20,
              right: Dimensions.width20,
              top: Dimensions.height20 * 2,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: AppIcon(
                        icon: Icons.arrow_back_ios,
                        iconColor: Colors.white,
                        backgroundColor: AppColors.mainColor,
                        iconSize: Dimensions.iconSize24,
                      ),
                    ),
                    SizedBox(width: Dimensions.width20 * 5),
                    AppIcon(
                      icon: Icons.home_outlined,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      iconSize: Dimensions.iconSize24,
                    ),
                    AppIcon(
                      icon: Icons.shopping_cart_outlined,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      iconSize: Dimensions.iconSize24,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: Dimensions.height20 * 5,
              left: Dimensions.width20,
              right: Dimensions.width20,
              bottom: 0,
              child: Container(
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GetBuilder<CartController>(builder: (logic) {
                    return ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: logic.getItems.length,
                      itemBuilder: (_, index) {
                        return Container(
                          margin: EdgeInsets.only(top: Dimensions.height10),
                          height: 100,
                          width: double.maxFinite,
                          child: Row(
                            children: [
                              Container(
                                width: Dimensions.height20 * 5,
                                height: Dimensions.height20 * 5,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                    Dimensions.radius20,
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      AppConstants.BASE_URL +
                                          AppConstants.UPLOADS +
                                          logic.getItems[index].img!,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: Dimensions.width20),
                              Expanded(
                                child: Container(
                                  height: Dimensions.height20 * 5,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      BigText(
                                        text: logic.getItems[index].name!,
                                        color: AppColors.mainBlackColor,
                                      ),
                                      SmallText(text: 'Spicy'),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          BigText(
                                            text:
                                                '\$${logic.getItems[index].price}',
                                            color: Colors.red,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                              top: Dimensions.height10 - 5,
                                              bottom: Dimensions.height10 - 5,
                                              left: Dimensions.width20,
                                              right: Dimensions.width20,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                Dimensions.radius20,
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                AppIcon(
                                                  icon: Icons.remove,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                ),
                                                BigText(
                                                    text:
                                                        "${logic.getItems[index].quantity}"),
                                                AppIcon(
                                                  icon: Icons.add,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
