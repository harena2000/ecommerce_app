import 'package:ecommerce_app/api/product_request.dart';
import 'package:ecommerce_app/models/product/product_model.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  bool isLoading = false;

  List<ProductModel> updatedProduct = [];
  List<ProductModel> productList = [];
  List<ProductModel> mostRatedProduct = [];

  ProductRequest productRequest = ProductRequest();

  List<ProductModel> get productListReverse => productList.reversed.toList();

  void loading(bool isLoading) {
    this.isLoading = isLoading;
    notifyListeners();
  }

  Future<void> getProductList() async {
    loading(true);
    productList = await productRequest.getProductsList();
    notifyListeners();
    updatedProduct = setUdatedProduct();
    mostRatedProduct = setMostRatedProduct();
    loading(false);
  }

  List<ProductModel> setUdatedProduct() {
    List<ProductModel> list = [];
    for (var i = (productList.length - 1); i >= 0; i--) {
      if (i >= (productList.length - 6)) {
        list.add(productList[i]);
      }
    }
    return list;
  }

  List<ProductModel> setMostRatedProduct() {
    List<ProductModel> list = [];
    for (var i = 0; i < productList.length; i++) {
      if (productList[i].rating!.rate! >= 4.0) {
        if (list.length < 5) {
          list.add(productList[i]);
        }
      }
    }
    return list;
  }

  HomeProvider() {
    getProductList();
  }
}
