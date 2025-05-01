import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/providers/cart_provider.dart';
import '../widgets/exported_widget_files.dart';
import '../../data/data_sources/mock_data.dart';
import 'shop_screen.dart';
import 'cart_screen.dart';
import 'explore_screen.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    ShopScreen(),
    ExploreScreen(),
    CartScreen(),
    Center(child: Text('Favourite Page')),
    Center(child: Text('Account Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTabSelected: (index) {
          setState(() => _selectedIndex = index);
        },
      ),
    );
  }
}
