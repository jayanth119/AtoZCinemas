import 'package:atoz_cinema/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atoz_cinema/cubits/cubits.dart';
import 'package:atoz_cinema/screens/newspage.dart';

import 'package:atoz_cinema/screens/screens.dart';
import 'package:atoz_cinema/widgets/widgets.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    const HomeScreen(key: PageStorageKey('homeScreen')),
    const Scaffold(),
    const NewsScreem(),
    const Scaffold(),
    const ProfileScreen(),
  ];

  final Map<String, IconData> _icons = const {
    'Home': Icons.home,
    'Search': Icons.search,
    'News': Icons.newspaper_outlined,
    'History': Icons.shopping_cart_checkout,
    'Profile': Icons.person,
  };

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AppBarCubit>(
        create: (_) => AppBarCubit(),
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: !Responsive.isDesktop(context)
          ? BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.black,
              items: _icons.entries.map((entry) {
                String title = entry.key;
                IconData icon = entry.value;
                return BottomNavigationBarItem(
                  icon: Icon(icon, size: 30.0),
                  label: title, // Adding label for each item
                );
              }).toList(),
              currentIndex: _currentIndex,
              selectedItemColor: Colors.white,
              selectedFontSize: 11.0,
              unselectedItemColor: Colors.grey,
              unselectedFontSize: 11.0,
              onTap: (index) => setState(() => _currentIndex = index),
            )
          : null,
    );
  }
}
