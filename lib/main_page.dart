import 'package:bookTracker/pages/all_books.dart';
import 'package:bookTracker/pages/favorite_quotes.dart';
import 'package:bookTracker/pages/my_library.dart';
import 'package:bookTracker/pages/my_reviews.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    // SignUp(),
    AllBooks(),
    MyReview(),
    FavoriteQuotes(),
    MyLibrary(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Books',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notes),
              label: 'My reviews',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.format_quote_rounded),
              label: 'Favorite quotes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              label: 'My library',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      );
  }
}