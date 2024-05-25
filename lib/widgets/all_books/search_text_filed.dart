import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/data_bloc/book_bloc.dart';
import '../../bloc/data_bloc/book_event.dart';



class SearchTextField extends StatelessWidget{

  final ValueNotifier<String> searchQueryNotifier;

  SearchTextField({required this.searchQueryNotifier});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final BookBloc bookBloc = BlocProvider.of<BookBloc>(context);
    return CupertinoSearchTextField(
          controller: controller,
          autofocus: true,
          placeholder: 'Enter a title of a book or an author name',
          onChanged: (query) {
            bookBloc.add(BookEvent(controller.text));
            // searchQueryNotifier.value = query;
          },
    );
  }
}