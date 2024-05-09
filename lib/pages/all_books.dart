import 'package:bookTracker/bloc/data_bloc/book_bloc.dart';
import 'package:bookTracker/services/repository/book_repository.dart';
import 'package:bookTracker/widgets/all_books/book_list.dart';
import 'package:bookTracker/widgets/title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/all_books/search_button.dart';
import '../widgets/all_books/search_text_filed.dart';

class AllBooks extends StatefulWidget {

  @override
  _AllBooksState createState() => _AllBooksState();
}

class _AllBooksState extends State<AllBooks> {

  final bookRepository = BookRepository();
  // TextEditingController _searchController = TextEditingController();
  final searchQueryNotifier = ValueNotifier<String>('');

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookBloc>(
      create: (context) => BookBloc(bookRepository),
      child: Scaffold(
        appBar: AppBar(
            title: TitleField()
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child:  SearchTextField(searchQueryNotifier: searchQueryNotifier,),
            ),
            SizedBox(
              height: 20,
            ),
            // SearchButton(searchQuery:searchQueryNotifier.value),
            BookList(),
          ],
        ),
      ),
    );

  }
}

