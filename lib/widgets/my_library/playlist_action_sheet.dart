import 'package:flutter/cupertino.dart';

import '../../bloc/enum_playlist_values.dart';
import '../../services/repository/playlist_repository.dart';

class PlaylistActionSheet {
  void showModalWindow (BuildContext context, String title, String authorName, String ISBN) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text("Add to playlist"),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: Text(PlaylistEventHandler.handlePlaylistValue(PlaylistValues.readList)),
              onPressed: () {
                PlaylistRepository().addToPlayList(title, authorName, ISBN, PlaylistValues.readList);
                Navigator.pop(context);
              },
            ),
            CupertinoActionSheetAction(
                child: Text(PlaylistEventHandler.handlePlaylistValue(PlaylistValues.readingList)),
                onPressed: () {
                  PlaylistRepository().addToPlayList(title, authorName, ISBN, PlaylistValues.readingList);
                  Navigator.pop(context); // it should be replaced later
                }
            ),
            CupertinoActionSheetAction(
              child: Text(PlaylistEventHandler.handlePlaylistValue(PlaylistValues.willReadList)),
              onPressed: () {
                PlaylistRepository().addToPlayList(title, authorName, ISBN, PlaylistValues.willReadList);
                Navigator.pop(context); // it should be replaced later
              },
            ),
          ],
        );
      },
    );
  }

}