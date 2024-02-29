import 'package:ecommerce_app/models/product/product_model.dart';
import 'package:hive/hive.dart';

part 'product_list.g.dart';

@HiveType(typeId: 1)
class ProductList {
  @HiveField(0)
  List<ProductModel> productList;

  ProductList({required this.productList});
}
