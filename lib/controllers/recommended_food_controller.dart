import 'package:food_delivery_full_stack_app/data/repository/recommended_product_repo.dart';
import 'package:get/get.dart';

import '../core/models/apiModel.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});

  List<ProductModel> _recommendedProductList = [];
  List<ProductModel> get recommendedProductList => _recommendedProductList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedList() async {
    Response response =
        await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {
      print('did not got recommended products');
    }
  }

  // int _quantity=0;
  // int get quantity => _quantity;
  //
  // void setQuantity(bool isIncrement){
  //
  // if (isIncrement) {
  //     _quantity=_quantity+1;
  // }  else
  //   {
  //     _quantity=_quantity-1;
  //   }
  // update();
  // }
}
