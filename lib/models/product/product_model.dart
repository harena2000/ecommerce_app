import 'package:ecommerce_app/models/product/rating_model.dart';

class ProductModel {
  int? id;
  String? title;
  num? price;
  String? description;
  String? category;
  String? image;
  RatingModel? rating;
  bool? isLiked;

  ProductModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating,
      this.isLiked = false});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating =
        json['rating'] != null ? RatingModel.fromJson(json['rating']) : null;
    isLiked = false;
  }

  void changeLikedStatus(bool isLiked) {
    this.isLiked = isLiked;
  }
}
