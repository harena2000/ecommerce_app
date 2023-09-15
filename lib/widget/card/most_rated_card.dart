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
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black,
              Colors.white,
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    productModel.title ?? "Product Title",
                    style: const TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: Colors.white),
                    overflow: TextOverflow.fade,
                    softWrap: true,
                    maxLines: 2,
                  ),
                  Text(
                    "Price : ${productModel.description!} \$",
                    style: const TextStyle(
                        fontFamily: "Lato", fontSize: 13, color: Colors.grey),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                    maxLines: 4,
                  ),
                  Text(
                    productModel.description ?? "Product Title",
                    style: const TextStyle(
                        fontFamily: "Lato", fontSize: 13, color: Colors.grey),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                    maxLines: 4,
                  ),
                  RatingBar.builder(
                    initialRating: productModel.rating!.rate!,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      FontAwesomeIcons.star,
                      color: AppColors.blueLight,
                    ),
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
      ),
    );
  }
}
