import 'package:animate_do/animate_do.dart';
import 'package:ecommerce_app/constant/app_assets.dart';
import 'package:ecommerce_app/constant/app_colors.dart';
import 'package:ecommerce_app/constant/fake_data.dart';
import 'package:ecommerce_app/provider/search_provider.dart';
import 'package:ecommerce_app/screen/product/product_details_screen.dart';
import 'package:ecommerce_app/widget/card/product_card.dart';
import 'package:ecommerce_app/widget/tag/rounded_tag.dart';
import 'package:ecommerce_app/widget/tag/simple_tag.dart';
import 'package:ecommerce_app/widget/text_field/rounded_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  TextEditingController searchController = TextEditingController();
  int actualIndex = 0;
  List<bool> productLiked = [];
  int tagSelectedIndex = 0;

  bool seeAll = false;

  final _formKey = GlobalKey<FormState>();
  String searchText = "";

  RegExp searchHistoryRegExp = RegExp(" ");

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(builder: (context, searchProvider, child) {
      return CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Stack(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Form(
                                      key: _formKey,
                                      child: RoundedTextField(
                                        controller: searchController,
                                        hintText: "Search...",
                                        showSuffix: true,
                                        inputAction: TextInputAction.search,
                                        suffixIcon: FontAwesomeIcons.sliders,
                                        onChange: (value) {
                                          setState(() {
                                            searchText = value;
                                          });
                                        },
                                        onSubmit: (value) {
                                          if (searchText.isNotEmpty) {
                                            int spaceCount = searchText.length;
                                            if (spaceCount <= 20) {
                                              if (!searchProvider.searchHistory
                                                  .contains(searchText)) {
                                                searchProvider.setSearchHistory(
                                                    searchText);
                                              }
                                            }
                                          }
                                        },
                                      ),
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
                              height: 10,
                            ),
                            SizedBox(
                              height: 40,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: FakeData.categories.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: const EdgeInsets.only(right: 5),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          tagSelectedIndex = index;
                                        });
                                      },
                                      child: RoundedTag(
                                        text: FakeData.categories[index]
                                            .replaceFirst(
                                          FakeData.categories[index][0],
                                          FakeData.categories[index][0]
                                              .toUpperCase(),
                                        ),
                                        withIcon: tagSelectedIndex == index,
                                        fillColor: AppColors.darkBlue,
                                        filled: tagSelectedIndex == index,
                                        foregroundColor: Colors.black,
                                        withBorder: false,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Search History",
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 40,
                                  child: searchProvider.searchHistory.isEmpty
                                      ? const SizedBox(
                                          width: 150,
                                          child: SimpleTag(
                                            text: "No Search History",
                                            backgroundColor: Colors.white,
                                            radius: 8,
                                          ),
                                        )
                                      : ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: searchProvider
                                              .searchHistory.length,
                                          reverse: true,
                                          itemBuilder: (context, index) {
                                            return FadeIn(
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    right: 5),
                                                child: GestureDetector(
                                                  onLongPress: () {
                                                    Clipboard.setData(ClipboardData(
                                                            text: searchProvider
                                                                    .searchHistory[
                                                                index]))
                                                        .then(
                                                      (value) =>
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                        const SnackBar(
                                                          content: Text(
                                                            "Copied to Clipboard",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "Montserrat",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: SimpleTag(
                                                    text: searchProvider
                                                        .searchHistory[index],
                                                    backgroundColor:
                                                        Colors.white,
                                                    radius: 8,
                                                    withIcon: true,
                                                    onIconPressed: () {
                                                      searchProvider
                                                          .deleteSearchItem(
                                                        index,
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Last Viewed",
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: Colors.white,
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
                childAspectRatio: 0.6,
              ),
              delegate: SliverChildBuilderDelegate(
                childCount: searchProvider.allLastViewedProduct.length,
                (context, index) {
                  return Stack(
                    alignment: Alignment.topRight,
                    children: [
                      GestureDetector(
                        onTap: () {
                          searchProvider.addToLastViewedProduct(
                            searchProvider.allLastViewedProduct[index],
                          );
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ProductDetailsScreen(
                                productModel:
                                    searchProvider.allLastViewedProduct[index],
                              ),
                            ),
                          );
                        },
                        child: ProductCard(
                          productModel:
                              searchProvider.allLastViewedProduct[index],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      );
    });
  }
}
