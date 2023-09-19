import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/constant/app_colors.dart';
import 'package:ecommerce_app/models/product/product_model.dart';
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 18),
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
                      fontSize: 16,
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
                RatingBar(
                  ratingWidget: RatingWidget(
                    full: const Icon(
                      FontAwesomeIcons.solidStar,
                      color: AppColors.darkBlue,
                    ),
                    half: const Icon(
                      FontAwesomeIcons.solidStarHalfStroke,
                      color: AppColors.darkBlue,
                    ),
                    empty: const Icon(
                      FontAwesomeIcons.star,
                      color: AppColors.darkBlue,
                    ),
                  ),
                  initialRating: productModel.rating!.rate!,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemSize: 12,
                  ignoreGestures: true,
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                )
              ],
            ),
          ),
          Expanded(
            child: CachedNetworkImage(
              imageUrl: productModel.image!,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
