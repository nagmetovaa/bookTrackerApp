
import 'package:bookTracker/models/quote.dart';

import '../provider/firebase_provider.dart';

class QuoteRepository {
  FirebaseProvider _firebaseProvider = FirebaseProvider();

  Future<void> addQuote(String title, String authorName, String ISBN, String value) => _firebaseProvider.addQuote(title, authorName, ISBN, value);

  Future<List<Quote>> getQuote() => _firebaseProvider.getQuoteData();

  // Future<List<Quote>> getQuoteByISBN(String ISBN) => _firebaseProvider.getQuoteByISBN(ISBN);

}