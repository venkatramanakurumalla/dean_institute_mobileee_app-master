import 'package:flutter/cupertino.dart';

class BatchSelectionController extends ChangeNotifier {
  int _selectedBatchIndex = -1;
  int get selectedIndex => _selectedBatchIndex;
  set selectedIndex(int index) {
    _selectedBatchIndex = index;
    notifyListeners();
  }
}
