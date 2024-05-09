import 'package:bookTracker/models/playlist_book.dart';
import '../../bloc/enum_playlist_values.dart';
import '../provider/firebase_provider.dart';

class PlaylistRepository {
  FirebaseProvider _firebaseProvider = FirebaseProvider();

  Future<List<PlaylistBook>> getBooksFromPlaylist() => _firebaseProvider.getDataFromFirebase();

  Future<void> addToPlayList(String title, String authorName, String ISBN, PlaylistValues value) => _firebaseProvider.addDataToPlayList(title, authorName, ISBN, value);

  Future<void> deleteDocument (String ISBN) => _firebaseProvider.deleteFromPlaylist(ISBN);

}