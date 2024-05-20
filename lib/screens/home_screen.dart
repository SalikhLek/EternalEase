import 'package:flutter/material.dart';
import 'yoga_screen.dart';
import 'meditation_screen.dart';
import 'quotes_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    YogaScreen(),
    MeditationScreen(),
    QuotesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.self_improvement),
            label: 'Йога',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: 'Медитация',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_quote),
            label: 'Цитаты',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
