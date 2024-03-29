import 'package:ecommerce_app/adapters/favorite/favorite_list.dart';
import 'package:ecommerce_app/adapters/history/history_list.dart';
import 'package:ecommerce_app/adapters/product/product_list.dart';
import 'package:ecommerce_app/navibar/main_page.dart';
import 'package:ecommerce_app/provider/favorite_provider.dart';
import 'package:ecommerce_app/provider/home_provider.dart';
import 'package:ecommerce_app/provider/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(ProductListAdapter());
  Hive.registerAdapter(HistoryListAdapter());
  Hive.registerAdapter(FavoriteListAdapter());

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FavoriteProvider(),
        ),
      ],
      child: const EcommerceApp(),
    ),
  );
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: "Lato",
        useMaterial3: true,
      ),
      home: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 0.9),
        child: const MainPage(),
      ),
    );
  }
}
