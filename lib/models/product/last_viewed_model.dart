import 'package:ecommerce_app/models/product/product_model.dart';

class LastViewedModel {
  final DateTime viewedTime;
  final ProductModel productModel;

  LastViewedModel({
    required this.viewedTime,
    required this.productModel,
  });
}
