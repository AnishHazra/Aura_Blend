import 'package:aura_blend/models/item.dart';
import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;
  const MyTabBar({super.key, required this.tabController});

  List<Widget> _buildCategoryTabs() {
    return FoodCategory.values.map((category) {
      return Tab(
        text: category.toReadableString(),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: Colors.red,
      controller: tabController,
      tabs: _buildCategoryTabs(),
    );
  }
}
