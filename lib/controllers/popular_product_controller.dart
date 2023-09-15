import 'package:flutter/material.dart';
import 'package:food_delivery_full_stack_app/controllers/cart_controller.dart';
import 'package:food_delivery_full_stack_app/core/utils/colors.dart';
import 'package:food_delivery_full_stack_app/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

import '../core/models/apiModel.dart';
import '../core/models/cart_model.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  ///cart instance here
  CartController _cartController = Get.find();

  ///variables
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  Future<void> getPopularList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = quantityCheck(_quantity + 1);
    } else {
      _quantity = quantityCheck(_quantity - 1);
    }
    update();
  }

  int quantityCheck(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar(
        'Item count',
        'You can\'t reduce more',
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 0;
    } else if ((_inCartItems + quantity) > 20) {
      Get.snackbar(
        'Item count',
        'You can\'t add more',
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 20;
    } else {
      return quantity;
    }
  }

  void initQuantity({product, CartController? cart}) {
    _quantity = 0;
    _inCartItems = 0;
    var exist = _cartController.existInCart(product);
    print('is product exist?   ${exist} ########');
    if (exist) {
      _inCartItems = _cartController.getQuantity(product);
    }
    print('the quantity exist in item carts ${_inCartItems}');
    //if exists
    //get from storage _inCartItems=3
  }

  void addItem(ProductModel product) {
    // if (_quantity > 0) {
    _cartController.addItem(product, _quantity);
    _quantity = 0;
    _inCartItems = _cartController.getQuantity(product);
    _cartController.items.forEach((key, value) {
      print(
          '@@@@@@@@@@@@@@@@@id is ${value.id} and quantity is ${value.quantity} ');
    });
    // }
    // else {
    //   Get.snackbar(
    //     'Item count',
    //     'You should add one item to cart',
    //     backgroundColor: AppColors.mainColor,
    //     colorText: Colors.white,
    //   );
    // }
    update();
  }

  int get totalItems {
    return _cartController.totalQuantity;
  }

  List<CartModel> get getItems {
    return _cartController.getItems;
  }
}
