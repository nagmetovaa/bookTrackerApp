

import 'package:share_plus/share_plus.dart';

import '../../models/review.dart';
import '../../services/repository/review_repository.dart';

class ShareToContact {

  Future<void> shareOnPressed (String title, String authorName, String ISBN) async {
    String theReview;
    String message;
    List<Review> reviewList = await ReviewRepository().getReviewByISBN(ISBN);
    if (reviewList.isNotEmpty) {
      theReview = reviewList[0].review;
      message = '$title by $authorName. My review: $theReview';
    } else {
      message = '$title by $authorName';
    }
    Share.share(message);
  }
}