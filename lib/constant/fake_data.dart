import 'package:ecommerce_app/models/product/product_model.dart';
import 'package:ecommerce_app/models/product/rating_model.dart';

class FakeData {
  static ProductModel productModel1 = ProductModel(
    title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
    price: 109.95,
    description:
        "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
    category: "men's clothing",
    image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    rating: RatingModel(
      rate: 3.9,
      count: 120,
    ),
  );

  static ProductModel productModel2 = ProductModel(
    title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
    price: 109.95,
    description:
        "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
    category: "men's clothing",
    image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    rating: RatingModel(
      rate: 3.9,
      count: 120,
    ),
  );

  static ProductModel productModel3 = ProductModel(
    title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
    price: 109.95,
    description:
        "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
    category: "men's clothing",
    image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    rating: RatingModel(
      rate: 3.9,
      count: 120,
    ),
  );

  static List<ProductModel> productList = [
    productModel1,
    productModel2,
    productModel3,
  ];
}
