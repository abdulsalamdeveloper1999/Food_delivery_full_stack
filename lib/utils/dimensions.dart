import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageViewContainers = screenHeight / 3.84;
  static double pageViewTextContainers = screenHeight / 7.03;
  static double pageView = screenHeight / 2.64;

  ///margin adn padding
  static double width10 = screenHeight / 84.4;
  static double width15 = screenHeight / 56.27;
  static double width20 = screenHeight / 42.2;
  static double width30 = screenHeight / 20.13;
  static double width45 = screenHeight / 18.76;

  ///Height
  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.27;
  static double height20 = screenHeight / 42.2;
  static double height30 = screenHeight / 20.13;
  static double height45 = screenHeight / 18.76;
  static double height120 = screenHeight / 7.03;

  ///font
  static double font20 = screenHeight / 42.2;
  static double font26 = screenHeight / 32.46;
  static double font16 = screenHeight / 52.75;

  ///radius
  static double radius15 = screenHeight / 56.27;
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.13;

  ///icon
  static double iconSize24 = screenHeight / 35.17;
  static double iconSize16 = screenHeight / 52.75;

  ///List view size
  static double listViewImgSize = screenWidth / 3.25;
  static double listViewTextContainerSize = screenWidth / 3.9;

  ///Popularfood
  static double popularFoodImgSize = screenHeight / 2.41;
}
