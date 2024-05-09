import 'package:flutter/material.dart';
import 'package:bookTracker/pages/my_library.dart';
import 'package:bookTracker/pages/my_reviews.dart';
import 'package:bookTracker/pages/search.dart';
import 'package:bookTracker/pages/all_books.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(MyApp());
  // runApp(const MyApp());
  // await Firebase.initializeApp();
}

class MyApp extends StatefulWidget {

  const MyApp({super.key});
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
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
    return MaterialApp(
      title: 'Book tracker',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.cyan[700]
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
      ),
      home: Scaffold(
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
      ),
      routes: {
        '/books': (context) => AllBooks(),
        '/review': (context) => MyReview(),
        '/quotes': (context) => FavoriteQuotes(),
        '/library': (context) => MyLibrary(),
      },
    );
  }
}
