// import 'package:atoz_cinema/pages/movieinfo.dart';
import 'package:atoz_cinema/pages/moviespage.dart';
import 'package:flutter/material.dart';

class BelowDisplay extends StatefulWidget {
  const BelowDisplay({super.key});

  @override
  State<BelowDisplay> createState() => _BelowDisplayState();
}

class _BelowDisplayState extends State<BelowDisplay> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MyGridScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Colors.green,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.movie_creation_outlined),
          label: 'Movie',
          backgroundColor: Colors.green,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event),
          label: 'Event',
          backgroundColor: Colors.green,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.manage_accounts),
          label: 'Profile',
          backgroundColor: Colors.green,
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: const Color.fromARGB(255, 14, 13, 13),
      onTap: _onItemTapped,
    );
  }
}
