
import 'package:flutter/cupertino.dart';

import '../../models/book.dart';

abstract class BookState{}

class BookEmptyState extends BookState{}

class BookLoadState extends BookState {}

class BookLoadedState extends BookState {
  List <dynamic>? loadedBook;
  BookLoadedState({required this.loadedBook}) : assert(loadedBook != null);
}
class BookErrorState extends BookState {
  print(e) {
    throw UnimplementedError();
  }
}