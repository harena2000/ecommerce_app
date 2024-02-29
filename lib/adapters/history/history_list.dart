import 'package:ecommerce_app/models/product/product_model.dart';
import 'package:hive/hive.dart';

part 'history_list.g.dart';

@HiveType(typeId: 2)
class HistoryList {
  @HiveField(0)
  List<ProductModel> productList;

  HistoryList({required this.productList});
}
