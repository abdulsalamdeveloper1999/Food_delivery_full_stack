import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_full_stack_app/components/big_text.dart';
import 'package:food_delivery_full_stack_app/components/icon_text.dart';
import 'package:food_delivery_full_stack_app/components/small_text.dart';
import 'package:food_delivery_full_stack_app/utils/colors.dart';
import 'package:food_delivery_full_stack_app/utils/dimensions.dart';

import '../../components/app_column.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(
    viewportFraction: 0.85,
  );
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainers;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///Slider
        Container(
          height: Dimensions.pageView,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position) {
              return _buildPageItem(position);
            },
          ),
        ),

        ///Dots
        DotsIndicator(
          dotsCount: 5,
          position: _currentPageValue.toInt(),
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),

        ///Popular Texts
        SizedBox(height: Dimensions.height30),
        Container(
          margin: EdgeInsets.only(
              left: Dimensions.width30, bottom: Dimensions.height30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Popular'),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: '.',
                  color: Colors.black26,
                ),
              ),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: EdgeInsets.only(bottom: 2),
                child: SmallText(text: 'Food paring'),
              ),
            ],
          ),
        ),

        ///Show List Of Food and Images
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                bottom: Dimensions.height10,
              ),
              child: Row(
                children: [
                  ///Image Section
                  Container(
                    width: Dimensions.listViewImgSize,
                    height: Dimensions.listViewImgSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white38,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/image/food0.png'),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Container(
                      height: Dimensions.listViewTextContainerSize,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(
                            Dimensions.radius20,
                          ),
                          bottomRight: Radius.circular(
                            Dimensions.radius20,
                          ),
                        ),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: Dimensions.width10,
                            right: Dimensions.width10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText(text: 'Nutritious fruit meal in china'),
                            SizedBox(height: Dimensions.height10),
                            SmallText(text: 'With chinese characteristics'),
                            SizedBox(height: Dimensions.height10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconAndText(
                                  text: 'Normal',
                                  icon: Icons.circle,
                                  iconColor: AppColors.iconColor1,
                                ),
                                IconAndText(
                                  text: '1.7 km',
                                  icon: Icons.location_off,
                                  iconColor: AppColors.mainColor,
                                ),
                                IconAndText(
                                  text: '32min',
                                  icon: Icons.access_time_rounded,
                                  iconColor: AppColors.iconColor1,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        )
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix4 = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTransform = _height * (1 - currentScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTransform, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currentScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currentTransform = _height * (1 - currentScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTransform, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTransform = _height * (1 - currentScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTransform, 0);
    } else {
      var currentScale = 0.8;
      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }

    return Transform(
      transform: matrix4,
      child: Stack(
        children: [
          Container(
            height: _height,
            margin: EdgeInsets.only(
                left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven ? Color(0xff69c5df) : Color(0xff9294cc),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/image/food0.png'),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainers,
              width: double.infinity,
              margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.height30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  ),
                ],
                color: Colors.white,
              ),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height15,
                    left: Dimensions.width15,
                    right: Dimensions.width15),
                child: AppColumn(
                  text: 'Chinese Side',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
