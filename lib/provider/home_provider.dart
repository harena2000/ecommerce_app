import 'package:dio/dio.dart';
import 'package:ecommerce_app/api/product_request.dart';
import 'package:ecommerce_app/models/product/product_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomeProvider with ChangeNotifier {
  bool isLoading = false;

  List<ProductModel> updatedProduct = [];
  List<ProductModel> productList = [];
  List<ProductModel> mostRatedProduct = [];

  late Box localProductList;

  bool hasError = false;
  String errorMessage = "";

  ProductRequest productRequest = ProductRequest();

  List<ProductModel> productListReverse = [];

  void loading(bool isLoading) {
    this.isLoading = isLoading;
    notifyListeners();
  }

  Future<void> getProductList() async {
    localProductList = await Hive.openBox<List<ProductModel>>("productList");

    loading(true);
    try {
      productList = await productRequest.getProductsList();
      notifyListeners();
    } on DioException catch (error) {
      hasError = true;
      notifyListeners();
    } finally {
      if (productList.isNotEmpty) {
        localProductList.clear();
        localProductList.put("localProductList", productList);
      }
      notifyListeners();

      updatedProduct = setUdatedProduct();
      productListReverse.addAll(productList.reversed.toList());
      mostRatedProduct = setMostRatedProduct();
      loading(false);
    }
  }

  List<ProductModel> setUdatedProduct() {
    List<ProductModel> list = [];
    List<ProductModel> localList = localProductList.get("localProductList");

    for (var i = (localList.length - 1); i >= 0; i--) {
      if (i >= (localList.length - 6)) {
        list.add(localList[i]);
      }
    }
    return list;
  }

  List<ProductModel> setMostRatedProduct() {
    List<ProductModel> list = [];
    List<ProductModel> localList = localProductList.get("localProductList");
    for (var i = 0; i < localList.length; i++) {
      if (localList[i].rating!.rate! >= 4.0) {
        if (list.length < 5) {
          list.add(localList[i]);
        }
      }
    }
    return list;
  }

  HomeProvider() {
    getProductList();
  }
}
