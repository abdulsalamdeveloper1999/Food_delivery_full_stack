import 'package:flutter/material.dart';
import 'package:food_delivery_full_stack_app/core/models/apiModel.dart';
import 'package:food_delivery_full_stack_app/core/models/cart_model.dart';
import 'package:food_delivery_full_stack_app/data/repository/cart_repo.dart';
import 'package:get/get.dart';

import '../core/utils/colors.dart';

class CartController extends GetxController {
  CartRepo cartRepo;
  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};

  Map<int, CartModel> get items => _items;

  void addItem(ProductModel product, int quantity) {
    var totalQuantity = 0;
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id!,
        (value) {
          totalQuantity = value.quantity! + quantity;

          return CartModel(
            id: value.id!,
            name: value.name!,
            price: value.price!,
            time: DateTime.now().toString(),
            img: value.img!,
            //add quantity it means update quantity only rest will be same
            quantity: value.quantity! + quantity,
            isExisted: true,
          );
        },
      );

      if (totalQuantity <= 0) {
        _items.remove(product.id);
      }
    } else {
      if (quantity > 0) {
        print('lenth of the cart is ${_items.length}');
        print(
            'adding items to cart name is ${product.name} and id is  ${product.id} and quantity is ${quantity}');
        _items.putIfAbsent(
          product.id!,
          () => CartModel(
            id: product.id!,
            name: product.name!,
            price: product.price!,
            time: DateTime.now().toString(),
            img: product.img!,
            quantity: quantity,
            isExisted: true,
          ),
        );
      } else {
        Get.snackbar(
          'Item count',
          'You should add one item to cart',
          backgroundColor: AppColors.mainColor,
          colorText: Colors.white,
        );
      }
    }
  }

  bool existInCart(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    } else {
      return false;
    }
  }

  int getQuantity(ProductModel product) {
    var quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalQuantity {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  List<CartModel> get getItems {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }
}
