import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:ecommerce_app/constant/app_assets.dart';
import 'package:ecommerce_app/constant/app_colors.dart';
import 'package:ecommerce_app/models/product/product_model.dart';
import 'package:ecommerce_app/provider/home_provider.dart';
import 'package:ecommerce_app/provider/search_provider.dart';
import 'package:ecommerce_app/screen/product/product_details_screen.dart';
import 'package:ecommerce_app/widget/card/most_rated_card.dart';
import 'package:ecommerce_app/widget/card/product_card.dart';
import 'package:ecommerce_app/widget/text_field/rounded_text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  int actualIndex = 0;
  List<bool> productLiked = [];
  bool seeAll = false;
  List<ProductModel> productList = [];

  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeProvider, SearchProvider>(
        builder: (context, homeProvider, searchProvider, child) {
      return Skeletonizer(
        enabled: homeProvider.isLoading,
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        height: 300,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.darkBlue,
                              AppColors.deepBlue,
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: SafeArea(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: RoundedTextField(
                                        controller: searchController,
                                        hintText: "Search...",
                                        showSuffix: true,
                                        suffixIcon: FontAwesomeIcons.sliders,
                                        onSubmit: (value) {},
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
                                            backgroundImage:
                                                AssetImage(AppAssets.avatar),
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
                                                      color: Colors.white,
                                                      width: 2)),
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
                                    fontSize: 25,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: 230,
                                child: Stack(
                                  alignment: Alignment.bottomLeft,
                                  children: [
                                    Card(
                                      clipBehavior: Clip.antiAlias,
                                      elevation: 5,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35),
                                        ),
                                      ),
                                      child: PageView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: homeProvider
                                            .mostRatedProduct.length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              SearchProvider searchProvider =
                                                  Provider.of<SearchProvider>(
                                                      context,
                                                      listen: false);
                                              searchProvider
                                                  .addToLastViewedProduct(
                                                homeProvider
                                                    .mostRatedProduct[index],
                                              );
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (_) =>
                                                      ProductDetailsScreen(
                                                    productModel: searchProvider
                                                            .allLastViewedProduct[
                                                        index],
                                                  ),
                                                ),
                                              );
                                            },
                                            child: MostRatedCard(
                                              productModel: homeProvider
                                                  .mostRatedProduct[index],
                                            ),
                                          );
                                        },
                                        onPageChanged: (value) {
                                          setState(() {
                                            actualIndex = value;
                                          });
                                        },
                                      ),
                                    ),
                                    Positioned(
                                      left: 30,
                                      bottom: 20,
                                      child: AnimatedSmoothIndicator(
                                        activeIndex: actualIndex,
                                        count: homeProvider
                                            .mostRatedProduct.length,
                                        effect: const ExpandingDotsEffect(
                                          dotWidth: 8,
                                          dotHeight: 8,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    seeAll
                                        ? "All Product".toUpperCase()
                                        : "Updated product".toUpperCase(),
                                    style: const TextStyle(
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w100,
                                      fontSize: 20,
                                      color: AppColors.deepBlue,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        seeAll = !seeAll;
                                      });
                                    },
                                    style: TextButton.styleFrom(
                                        backgroundColor:
                                            AppColors.greyDeepWhite),
                                    child: Text(
                                      seeAll ? "Last Updated" : "See All",
                                      style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15,
                                        color: AppColors.deepBlue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200.0,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 0.6,
                ),
                delegate: SliverChildBuilderDelegate(
                  childCount: seeAll
                      ? homeProvider.productListReverse.length
                      : homeProvider.updatedProduct.length,
                  (context, index) {
                    return FadeIn(
                      child: GestureDetector(
                        onTap: () {
                          SearchProvider searchProvider =
                              Provider.of<SearchProvider>(context,
                                  listen: false);
                          searchProvider.addToLastViewedProduct(
                            homeProvider.productListReverse[index],
                          );
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ProductDetailsScreen(
                                productModel:
                                    homeProvider.productListReverse[index],
                              ),
                            ),
                          );
                        },
                        child: ProductCard(
                            productModel:
                                homeProvider.productListReverse[index]),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
