import 'package:ecommerce_app/constant/app_colors.dart';
import 'package:ecommerce_app/provider/favorite_provider.dart';
import 'package:ecommerce_app/widget/image/image_from_network.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/models/product/product_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatefulWidget {
  final ProductModel productModel;
  final Function()? onTap;

  const ProductCard({
    Key? key,
    required this.productModel,
    this.onTap,
  }) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageFromNetwork(
          imageUrl: widget.productModel.image!,
          height: 150,
          fit: BoxFit.contain,
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
                  widget.productModel.title!,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "£ ${widget.productModel.price!}",
                      style: const TextStyle(
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        FavoriteProvider favoriteProvider =
                            Provider.of<FavoriteProvider>(context,
                                listen: false);

                        if (widget.productModel.isLiked!) {
                          favoriteProvider
                              .removeProductFromFavorite(widget.productModel);
                        } else {
                          favoriteProvider
                              .addToFavoriteList(widget.productModel);
                        }

                        setState(() {
                          widget.productModel
                              .changeLikedStatus(!widget.productModel.isLiked!);
                        });
                      },
                      icon: Icon(
                        widget.productModel.isLiked!
                            ? FontAwesomeIcons.solidHeart
                            : FontAwesomeIcons.heart,
                        color: widget.productModel.isLiked!
                            ? AppColors.orange
                            : Colors.grey,
                        size: 18,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
