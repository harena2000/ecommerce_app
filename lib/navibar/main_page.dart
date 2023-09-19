import 'package:ecommerce_app/constant/app_colors.dart';
import 'package:ecommerce_app/navibar/page/cart_page.dart';
import 'package:ecommerce_app/navibar/page/discover_page.dart';
import 'package:ecommerce_app/navibar/page/home_page.dart';
import 'package:ecommerce_app/navibar/page/rewards_page.dart';
import 'package:flutter/material.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> page = const [
    HomePage(),
    DiscoverPage(),
    RewardsPage(),
    CartPage(),
  ];

  List<bool> navbarButtonActive = [false, true, true, true];

  final PageController pageController = PageController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: page,
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: SlidingClippedNavBar(
        backgroundColor: Colors.white,
        onButtonPressed: (index) {
          setState(() {
            selectedIndex = index;
          });
          pageController.animateToPage(
            index,
            duration: const Duration(
              milliseconds: 400,
            ),
            curve: Curves.easeOutQuad,
          );
        },
        iconSize: 30,
        selectedIndex: selectedIndex,
        activeColor: AppColors.darkBlue,
        inactiveColor: Colors.grey,
        barItems: [
          BarItem(
            icon: Icons.home_filled,
            title: 'Home',
          ),
          BarItem(
            icon: Icons.search_sharp,
            title: 'Discover',
          ),
          BarItem(
            icon: Icons.wallet_giftcard_sharp,
            title: 'Rewards',
          ),
          BarItem(
            icon: Icons.shopping_cart_sharp,
            title: 'Cart',
          ),
        ],
      ),
    );
  }
}
