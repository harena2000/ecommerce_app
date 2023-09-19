import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/models/product/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel productModel;

  const ProductCard({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl: productModel.image!,
          height: 150,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModel.title!,
                  style: const TextStyle(
                    fontFamily: "Lato",
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.fade,
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "£ ${productModel.price!}",
                  style: const TextStyle(
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
