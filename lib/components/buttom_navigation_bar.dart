import 'package:aura_blend/pages/cart_page.dart';
import 'package:aura_blend/pages/home_page.dart';
import 'package:aura_blend/pages/most_selling_page.dart';
import 'package:aura_blend/pages/perfume_page.dart';
import 'package:aura_blend/pages/settings_page.dart';
import 'package:flutter/material.dart';

class BottomNavBarExample extends StatefulWidget {
  const BottomNavBarExample({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavBarExampleState createState() => _BottomNavBarExampleState();
}

class _BottomNavBarExampleState extends State<BottomNavBarExample> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const PerfumePage(),
    const MostSellingPage(),
    const HomePage(),
    const CartPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xffb6d0f3),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
