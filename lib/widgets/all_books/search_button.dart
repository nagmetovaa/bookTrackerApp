import 'package:bookTracker/bloc/data_bloc/book_bloc.dart';
import 'package:bookTracker/bloc/data_bloc/book_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchButton extends StatelessWidget{

  final String searchQuery;

  SearchButton({required this.searchQuery});


  @override
  Widget build(BuildContext context) {
    final BookBloc bookBloc = BlocProvider.of<BookBloc>(context);
    return CupertinoButton(
        child: Text('Load'),
        onPressed: () {
          bookBloc.add(BookEvent(searchQuery));
          print('hi');
          print(searchQuery);
        }
    );
  }
}