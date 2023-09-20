import 'package:ecommerce_app/constant/app_assets.dart';
import 'package:ecommerce_app/constant/app_colors.dart';
import 'package:ecommerce_app/constant/fake_data.dart';
import 'package:ecommerce_app/screen/product/product_details_screen.dart';
import 'package:ecommerce_app/widget/card/product_card.dart';
import 'package:ecommerce_app/widget/text_field/rounded_text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sliver_tools/sliver_tools.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  TextEditingController searchController = TextEditingController();
  int actualIndex = 0;
  List<bool> productLiked = [];

  @override
  void initState() {
    super.initState();

    productLiked = List.generate(FakeData.productList.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
                          AppColors.deepBlue,
                          AppColors.deepBlueLight,
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
                                fontSize: 30,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Updated product".toUpperCase(),
                            style: const TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w100,
                              fontSize: 30,
                              color: AppColors.deepBlue,
                            ),
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
              childAspectRatio: 0.75,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              return Stack(
                alignment: Alignment.topRight,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => ProductDetailsScreen(
                            productModel: FakeData.productList[index],
                          ),
                        ),
                      );
                    },
                    child: ProductCard(
                      productModel: FakeData.productList[index],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        productLiked[index] = !productLiked[index];
                      });
                    },
                    icon: Icon(
                      productLiked[index]
                          ? FontAwesomeIcons.solidHeart
                          : FontAwesomeIcons.heart,
                      color:
                          productLiked[index] ? AppColors.orange : Colors.grey,
                    ),
                  )
                ],
              );
            }, childCount: FakeData.productList.length),
          ),
        )
      ],
    );
  }
}
