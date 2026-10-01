import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/custom_bottom_nav_bar.dart';
import 'package:news_app/features/bookmark/views/bookmark_screen.dart';
import 'package:news_app/features/home/views/home_screen.dart';

import '../../weather_screen/views/weather_screen.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex =0;
  final List<Widget> _pages = [
    const HomeScreen(),
    const HomeScreen(),
    const BookmarkScreen(),
    const WeatherScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: _currentIndex,
          onItemSelected: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
    );
  }
}

