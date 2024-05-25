import 'package:bookTracker/pages/sign_in.dart';
import 'package:bookTracker/pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:bookTracker/pages/my_library.dart';
import 'package:bookTracker/pages/my_reviews.dart';
import 'package:bookTracker/pages/favorite_quotes.dart';
import 'package:bookTracker/pages/all_books.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'main_page.dart';



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

  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  void _checkLoginStatus() async {

    // Здесь нужно добавить проверку логина пользователя, например, из локального хранилища или Firebase.
    // Сейчас мы просто выставим _isLoggedIn в false для примера.
    // Если пользователь уже залогинен, выставляем _isLoggedIn в true.

    // Пример проверки:
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    setState(() {
      _isLoggedIn = false; // Измените это на реальную проверку
    });
  }
  // int _selectedIndex = 0;

  // final List<Widget> _pages = [
  //   // SignUp(),
  //   AllBooks(),
  //   MyReview(),
  //   FavoriteQuotes(),
  //   MyLibrary(),
  // ];
  //
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Tracker',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.cyan[700]),
        // brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
      ),
      home: _isLoggedIn ? MainPage() : SignIn(onRegistrationComplete: _onRegistrationComplete),
      routes: {
        '/main': (context) => MainPage(),
        '/books': (context) => AllBooks(),
        '/review': (context) => MyReview(),
        '/quotes': (context) => FavoriteQuotes(),
        '/library': (context) => MyLibrary(),
        // '/signin': (context) => SignIn(onRegistrationComplete: onRegistrationComplete)
        '/signup': (context) => SignUp()
      },
    );
  }

  void _onRegistrationComplete() {
    setState(() {
      _isLoggedIn = true;
    });
  }
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Book tracker',
  //     theme: ThemeData(
  //       appBarTheme: AppBarTheme(
  //         color: Colors.cyan[700]
  //       ),
  //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
  //       useMaterial3: true,
  //     ),
  //     home: Scaffold(
  //       body: _pages[_selectedIndex],
  //       bottomNavigationBar: BottomNavigationBar(
  //         type: BottomNavigationBarType.fixed,
  //         items: const <BottomNavigationBarItem>[
  //           BottomNavigationBarItem(
  //             icon: Icon(Icons.list),
  //             label: 'Books',
  //           ),
  //           BottomNavigationBarItem(
  //             icon: Icon(Icons.notes),
  //             label: 'My reviews',
  //           ),
  //           BottomNavigationBarItem(
  //             icon: Icon(Icons.format_quote_rounded),
  //             label: 'Favorite quotes',
  //           ),
  //           BottomNavigationBarItem(
  //             icon: Icon(Icons.library_books),
  //             label: 'My library',
  //           ),
  //         ],
  //         currentIndex: _selectedIndex,
  //         onTap: _onItemTapped,
  //       ),
  //     ),
  //     routes: {
  //       '/books': (context) => AllBooks(),
  //       '/review': (context) => MyReview(),
  //       '/quotes': (context) => FavoriteQuotes(),
  //       '/library': (context) => MyLibrary(),
  //       '/signup': (context) => SignUp(),
  //     },
  //   );
  // }
}
