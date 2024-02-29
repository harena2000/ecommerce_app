import 'package:dio/dio.dart';
import 'package:ecommerce_app/api/base_api_request.dart';
import 'package:ecommerce_app/models/product/product_model.dart';

class ProductRequest {
  final baseApi = BaseApiRequest();

  Future<List<ProductModel>> getProductsList(
      {int? limit = 20, bool? isDesc = false}) async {
    String endPoint =
        "/products?limit=$limit&${(isDesc!) ? "sort=desc" : "sort=asc"}";

    Response response =
        await baseApi.dio().then((method) => method.get(endPoint));

    return (response.data! as List)
        .map((json) => ProductModel.fromJson(json))
        .toList();
  }
}
