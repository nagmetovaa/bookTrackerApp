import '../../models/review.dart';
import '../provider/firebase_provider.dart';

class ReviewRepository {

  FirebaseProvider _firebaseProvider = FirebaseProvider();

  Future<List<Review>> getReview() => _firebaseProvider.getReviewData();

  Future<void> addReview(String title, String authorName, String ISBN, String value) => _firebaseProvider.addReview(title, authorName, ISBN, value);

  Future<List<Review>> getReviewByISBN(String ISBN) => _firebaseProvider.getReviewByISBN(ISBN);
}