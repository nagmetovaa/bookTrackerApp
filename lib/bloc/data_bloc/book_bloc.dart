import 'package:bookTracker/bloc/data_bloc/book_event.dart';
import 'package:bookTracker/bloc/data_bloc/book_state.dart';
import 'package:bookTracker/services/repository/book_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/book.dart';

class BookBloc extends Bloc<BookEvent, BookState> {

  final BookRepository bookRepository;

  BookBloc(this.bookRepository) : super(BookEmptyState());


  @override
  Stream<BookState> mapEventToState(BookEvent event) async*{
    if (event is BookEvent) {
      yield BookLoadState();
      try{
        final List<Book>? _loadedBookList = await bookRepository.getAllBooks(event.query);
        // print(event.query);
        yield BookLoadedState(loadedBook: _loadedBookList);
      }catch (e) {
        yield BookErrorState();
        print('${e}');
      }
    }
  }
}
