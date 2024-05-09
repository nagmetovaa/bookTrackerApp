import 'package:flutter/material.dart';

enum PlaylistValues {
  readList,
  readingList,
  willReadList
}

class PlaylistEventHandler {

  static String handlePlaylistValue(PlaylistValues value) {
    switch (value) {
      case PlaylistValues.readList:
        return 'Read';
        break;
      case PlaylistValues.readingList:
        return 'Reading';
        break;
      case PlaylistValues.willReadList:
        return 'Will read';
        break;
    }
  }
}