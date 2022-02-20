import 'package:flutter/cupertino.dart';

class DynamicTabController with ChangeNotifier{
  String _selectedTab = "";
  String get selectedTab => _selectedTab;

  set selectedTab(String tab){
    _selectedTab = tab;
    notifyListeners();
  }
}