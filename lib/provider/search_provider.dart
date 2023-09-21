import 'package:ecommerce_app/models/product/product_model.dart';
import 'package:flutter/material.dart';

class SearchProvider with ChangeNotifier {
  List<String> searchHistory = [];
  List<ProductModel> searchProduct = [];
  String searchText = "";

  void setSearchHistory(String text) {
    searchText = text;
    searchHistory.add(text);
    notifyListeners();
  }

  void setSearchProduct(List<ProductModel> searchList) {
    searchProduct.addAll(searchList);
    notifyListeners();
  }

  void deleteSearchItem(int index) {
    searchHistory.removeAt(index);
    notifyListeners();
  }
}
