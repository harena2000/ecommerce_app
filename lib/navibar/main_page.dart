import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerce_app/navibar/page/cart_page.dart';
import 'package:ecommerce_app/navibar/page/discover_page.dart';
import 'package:ecommerce_app/navibar/page/home_page.dart';
import 'package:ecommerce_app/navibar/page/rewards_page.dart';
import 'package:ecommerce_app/widget/icon/navbar_icon.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

  List<Widget> page = const [
    HomePage(),
    DiscoverPage(),
    RewardsPage(),
    CartPage(),
  ];

  List<bool> navbarButtonActive = [false, true, true, true];

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: page,
        onPageChanged: (int index) {
          setState(() {
            for (var i = 0; i < navbarButtonActive.length; i++) {
              if (index == i) {
                navbarButtonActive[index] = false;
              } else {
                navbarButtonActive[i] = true;
              }
            }
          });
        },
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: Colors.white,
        key: bottomNavigationKey,
        index: 0,
        items: <Widget>[
          NavbarIcon(
            activateIcon: Icons.home_filled,
            deactivateIcon: Icons.home_outlined,
            text: "Home",
            isActivate: !navbarButtonActive[0],
          ),
          NavbarIcon(
            activateIcon: Icons.search_sharp,
            deactivateIcon: Icons.search_rounded,
            text: "Discover",
            isActivate: !navbarButtonActive[1],
          ),
          NavbarIcon(
            activateIcon: Icons.wallet_giftcard_sharp,
            deactivateIcon: Icons.wallet_giftcard_outlined,
            text: "Rewards",
            isActivate: !navbarButtonActive[2],
          ),
          NavbarIcon(
            activateIcon: Icons.shopping_cart_sharp,
            deactivateIcon: Icons.shopping_cart_outlined,
            text: "Cart",
            isActivate: !navbarButtonActive[3],
          ),
        ],
        animationCurve: Curves.easeInOut,
        onTap: (index) {
          setState(() {
            for (var i = 0; i < navbarButtonActive.length; i++) {
              if (index == i) {
                navbarButtonActive[index] = false;
              } else {
                navbarButtonActive[i] = true;
              }
            }
            pageController.jumpToPage(index);
          });
        },
      ),
    );
  }
}
