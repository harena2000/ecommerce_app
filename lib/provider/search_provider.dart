import 'package:flutter/material.dart';

class SearchProvider with ChangeNotifier {
  List<String> searchHistory = [];

  void setSearchHistory(String text) {
    searchHistory.add(text);
    notifyListeners();
  }
}
