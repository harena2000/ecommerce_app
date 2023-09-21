import 'package:ecommerce_app/constant/app_colors.dart';
import 'package:ecommerce_app/models/product/product_model.dart';
import 'package:ecommerce_app/widget/image/image_from_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MostRatedCard extends StatelessWidget {
  final ProductModel productModel;

  const MostRatedCard({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
              width: MediaQuery.of(context).size.width / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productModel.title ?? "Product Title",
                    style: const TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Colors.black),
                    overflow: TextOverflow.fade,
                    softWrap: true,
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Price : ${productModel.price!} £",
                    style: const TextStyle(
                        fontFamily: "Lato", fontSize: 16, color: Colors.black),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                    maxLines: 4,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    productModel.description ?? "Product description",
                    style: const TextStyle(
                        fontFamily: "Lato", fontSize: 12, color: Colors.grey),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                    maxLines: 4,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.solidStar,
                        size: 16,
                        color: Colors.amber,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        productModel.rating!.rate.toString(),
                        style: const TextStyle(
                            fontFamily: "Lato",
                            fontSize: 12,
                            color: AppColors.darkBlue),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 10,
            top: 10,
            child: ImageFromNetwork(
              imageUrl: productModel.image!,
              width: MediaQuery.of(context).size.width / 2.4,
              height: MediaQuery.of(context).size.height / 2,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
