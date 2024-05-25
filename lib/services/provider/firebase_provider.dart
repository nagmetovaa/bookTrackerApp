import 'package:bookTracker/bloc/enum_playlist_values.dart';
import 'package:bookTracker/models/quote.dart';
import 'package:bookTracker/models/review.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../models/playlist_book.dart';


class FirebaseProvider {


  Future<void> addDataToPlayList(String title, String authorName, String ISBN, PlaylistValues value) async {

    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      throw Exception("No user is currently signed in.");
    }
    String userEmail = user.email!;


    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('playlists')
        .where('ISBN', isEqualTo: ISBN)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      DocumentSnapshot doc = querySnapshot.docs.first;
      await doc.reference.update({'playlist': _playlistValueToString(value)});
    } else {
      Map<String, dynamic> data = {
        'title': title,
        'authorName': authorName,
        'ISBN': ISBN,
        'playlist': _playlistValueToString(value),
        'email':userEmail,
      };
      await FirebaseFirestore.instance.collection('playlists').add(data);
    }
    }

  String _playlistValueToString(PlaylistValues value) {
    switch(value) {
      case PlaylistValues.readList:
        return '1';
      case PlaylistValues.readingList:
        return '2';
      case PlaylistValues.willReadList:
        return '3';
      default:
        return '';
    }
  }


  Future<void> addReview(String title, String authorName, String ISBN, String value) async {

    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      throw Exception("No user is currently signed in.");
    }
    String userEmail = user.email!;
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('reviews')
        .where('ISBN', isEqualTo: ISBN)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      DocumentSnapshot doc = querySnapshot.docs.first;
      await doc.reference.update({'review': value});
    } else {
      Map<String, dynamic> data = {
        'title': title,
        'authorName': authorName,
        'ISBN': ISBN,
        'review': value,
        'email':userEmail,
      };
      await FirebaseFirestore.instance.collection('reviews').add(data);
    }
  }


  Future<void> addQuote(String title, String authorName, String ISBN, String value) async {

    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      throw Exception("No user is currently signed in.");
    }
    String userEmail = user.email!;

      Map<String, dynamic> data = {
        'title': title,
        'authorName': authorName,
        'ISBN': ISBN,
        'quote': value,
        'email':userEmail,
      };
      await FirebaseFirestore.instance.collection('quotes').add(data);
  }


  Future<List<PlaylistBook>> getDataFromFirebase() async{

    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      throw Exception("No user is currently signed in.");
    }
    String userEmail = user.email!;

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('playlists')
        .where('email', isEqualTo: userEmail)
        .get();

    final List<PlaylistBook> playLists = [];

    for (final doc in querySnapshot.docs) {
      Map<String, dynamic>? dataList = doc.data() as Map<String, dynamic>?;
      PlaylistBook playlistBook = PlaylistBook(
        title: dataList?['title'],
        authorName: dataList?['authorName'],
        playlist: dataList?['playlist'],
        isbn: dataList?['ISBN']
      );
      playLists.add(playlistBook);
    }
    return playLists;

  }

  Future<List<Review>> getReviewData() async{

    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      throw Exception("No user is currently signed in.");
    }
    String userEmail = user.email!;

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('reviews')
        .where('email', isEqualTo: userEmail)
        .get();

    final List<Review> reviewLists = [];

    for (final doc in querySnapshot.docs) {
      Map<String, dynamic>? dataList = doc.data() as Map<String, dynamic>?;
      Review review = Review(
          title: dataList?['title'],
          authorName: dataList?['authorName'],
          review: dataList?['review'],
          isbn: dataList?['ISBN']
      );
      reviewLists.add(review);
    }
    return reviewLists;

  }

  Future<List<Quote>> getQuoteData() async{
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      throw Exception("No user is currently signed in.");
    }
    String userEmail = user.email!;

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('quotes')
        .where('email', isEqualTo: userEmail)
        .get();

    final List<Quote> quoteLists = [];

    for (final doc in querySnapshot.docs) {
      Map<String, dynamic>? dataList = doc.data() as Map<String, dynamic>?;
      Quote quote = Quote(
          title: dataList?['title'],
          authorName: dataList?['authorName'],
          quote: dataList?['quote'],
          isbn: dataList?['ISBN']
      );
      quoteLists.add(quote);
    }
    return quoteLists;

  }

  Future<void> deleteFromPlaylist (String ISBN) async {
    CollectionReference collectionRef = FirebaseFirestore.instance.collection('playlists');
    await collectionRef.where('ISBN', isEqualTo: ISBN).get().then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        doc.reference.delete();
      });
    });

  }

  Future<List<Review>> getReviewByISBN(String ISBN) async{
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('reviews')
        .where('ISBN', isEqualTo: ISBN)
        .get();

    final List<Review> reviewLists = [];

    for (final doc in querySnapshot.docs) {
      Map<String, dynamic>? dataList = doc.data() as Map<String, dynamic>?;
      Review review = Review(
          title: dataList?['title'],
          authorName: dataList?['authorName'],
          review: dataList?['review'],
          isbn: dataList?['ISBN']
      );
      reviewLists.add(review);
    }
    return reviewLists;

  }

  // Future<List<Quote>> getQuoteByISBN(String ISBN) async{
  //   QuerySnapshot querySnapshot = await FirebaseFirestore.instance
  //       .collection('quotes')
  //       .where('ISBN', isEqualTo: ISBN)
  //       .get();
  //
  //   final List<Quote> quoteLists = [];
  //
  //   for (final doc in querySnapshot.docs) {
  //     Map<String, dynamic>? dataList = doc.data() as Map<String, dynamic>?;
  //     Quote quote = Quote(
  //         title: dataList?['title'],
  //         authorName: dataList?['authorName'],
  //         quote: dataList?['quote'],
  //         isbn: dataList?['ISBN']
  //     );
  //     quoteLists.add(quote);
  //   }
  //   return quoteLists;
  // }
}