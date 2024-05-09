import 'package:bookTracker/bloc/enum_playlist_values.dart';
import 'package:bookTracker/models/review.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/playlist_book.dart';


class FirebaseProvider {


  Future<void> addDataToPlayList(String title, String authorName, String ISBN, PlaylistValues value) async {
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
      };
      await FirebaseFirestore.instance.collection('reviews').add(data);
    }
  }


  Future<List<PlaylistBook>> getDataFromFirebase() async{
    final collection = FirebaseFirestore.instance.collection('playlists');
    final querySnapshot = await collection.get();

    final List<PlaylistBook> playLists = [];

    for (final doc in querySnapshot.docs) {
      Map<String, dynamic> dataList = doc.data();
      PlaylistBook playlistBook = PlaylistBook(
        title: dataList['title'],
        authorName: dataList['authorName'],
        playlist: dataList['playlist'],
        isbn: dataList['ISBN']
      );
      playLists.add(playlistBook);
    }
    return playLists;

  }

  Future<List<Review>> getReviewData() async{
    final collection = FirebaseFirestore.instance.collection('reviews');
    final querySnapshot = await collection.get();

    final List<Review> reviewLists = [];

    for (final doc in querySnapshot.docs) {
      Map<String, dynamic> dataList = doc.data();
      Review review = Review(
          title: dataList['title'],
          authorName: dataList['authorName'],
          review: dataList['review'],
          isbn: dataList['ISBN']
      );
      reviewLists.add(review);
    }
    return reviewLists;

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
}