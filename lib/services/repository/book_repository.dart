import 'package:bookTracker/models/book.dart';
import 'package:bookTracker/services/provider/book_api_provider.dart';

class BookRepository {
  BookProvider _booksProvider = BookProvider();

  Future<List<Book>?> getAllBooks(String query) => _booksProvider.getBookList(query);
}