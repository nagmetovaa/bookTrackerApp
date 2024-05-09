
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../services/repository/playlist_repository.dart';

class DeleteAlertDialog  {
  static void showConfirmationDialog(BuildContext context, String title, String message, String ISBN) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CupertinoDialogAction(
              child: Text('Confirm'),
              onPressed: () {
                PlaylistRepository().deleteDocument(ISBN);
                Navigator.pop(context);
                }
            ),
          ],
        );
      },
    );
  }
}