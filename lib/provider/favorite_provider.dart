import 'package:ecommerce_app/models/product/product_model.dart';
import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {
  List<ProductModel> favoriteProductList = [];

  void addToFavoriteList(ProductModel productModel) {
    favoriteProductList.add(productModel);
    notifyListeners();
  }

  void removeProductFromFavorite(ProductModel productModel) {
    favoriteProductList.remove(productModel);
    notifyListeners();
  }
}
