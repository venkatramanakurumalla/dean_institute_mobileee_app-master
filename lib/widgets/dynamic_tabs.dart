import 'package:dean_institute_mobile_app/controllers/dynamic_tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DynamicTabs extends StatefulWidget {
  DynamicTabs({
    Key? key,
  }) : super(key: key);

  static const List<String> _items = [
    "All",
    "Programming",
    "Algebra",
    "UI/UX",
    "Front End",
    "Trigonometry",
    "Calculus",
    "Accounting",
    "Life Skills",
    "Software Testing",
    "All Maths",
    "Economics",
    "Backend",
    "Mobile App",
    "US History",
    "Science",
    "Arts & Humanities",
  ];

  @override
  _DynamicTabsState createState() => _DynamicTabsState();
}

class _DynamicTabsState extends State<DynamicTabs> {
  final DynamicTabController _tabController = new DynamicTabController();

  @override
  void dispose(){
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> allTabs = [];
    for (int i = 0; i < DynamicTabs._items.length; i++) {
      allTabs.add(
        new Tab(
          text: DynamicTabs._items[i],
        ),
      );
    }

    _tabController.addListener(() {
      print("Selected tab = ${_tabController.selectedTab}");
    });

    return DefaultTabController(
      length: DynamicTabs._items.length,
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        isScrollable: true,
        labelColor: Colors.black,
        labelStyle: GoogleFonts.lato(color: Colors.black),
        unselectedLabelStyle: GoogleFonts.lato(color: Colors.grey),
        unselectedLabelColor: Colors.grey,
        tabs: allTabs,
        onTap: (position) {
          _tabController.selectedTab = DynamicTabs._items[position];
        },
      ),
    );


  }
}