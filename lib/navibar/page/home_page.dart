import 'dart:ui';

import 'package:ecommerce_app/constant/app_assets.dart';
import 'package:ecommerce_app/constant/app_colors.dart';
import 'package:ecommerce_app/constant/fake_data.dart';
import 'package:ecommerce_app/models/product/product_model.dart';
import 'package:ecommerce_app/models/product/rating_model.dart';
import 'package:ecommerce_app/widget/card/most_rated_card.dart';
import 'package:ecommerce_app/widget/text_field/rounded_text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 300,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.blueLight,
                AppColors.pinkLight,
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: RoundedTextField(
                          controller: searchController,
                          hintText: "Search...",
                          showSuffix: true,
                          suffixIcon: FontAwesomeIcons.sliders,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            const CircleAvatar(
                              radius: double.infinity,
                              backgroundImage: AssetImage(AppAssets.avatar),
                            ),
                            Positioned(
                              right: 3,
                              child: Container(
                                width: 13,
                                height: 13,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.white, width: 2)),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Most Rated".toUpperCase(),
                  style: const TextStyle(
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w100,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 300,
                  child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: FakeData.productList.length,
                    itemBuilder: (context, index) {
                      return MostRatedCard(
                        productModel: FakeData.productList[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
