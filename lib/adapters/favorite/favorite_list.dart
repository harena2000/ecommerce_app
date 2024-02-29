import 'package:ecommerce_app/models/product/product_model.dart';
import 'package:hive/hive.dart';

part 'favorite_list.g.dart';

@HiveType(typeId: 3)
class FavoriteList {
  @HiveField(0)
  List<ProductModel> productList;

  FavoriteList({required this.productList});
}
