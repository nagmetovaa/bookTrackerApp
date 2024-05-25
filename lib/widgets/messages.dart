import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bloc/enum_playlist_values.dart';
import '../pages/my_library.dart';

class MyMessages {

  void loginSuccess (BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Log in success!'),
          content: Text('Welcome back'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('OK'),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/main');
              },
            ),
          ],
        );
      },
    );
  }



  void registerSuccess (BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Successfully registered!'),
          content: Text('Welcome to Book tracker application!'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('OK'),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/main');
              },
            ),
          ],
        );
      },
    );
  }


  // void loginError (BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return CupertinoAlertDialog(
  //         title: Text('Log in success!'),
  //         content: Text('Welcome back'),
  //         actions: <Widget>[
  //           CupertinoDialogAction(
  //             child: Text('OK'),
  //             onPressed: () {
  //               Navigator.pushReplacementNamed(context, '/main');
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }



  void registerOrLoginError (BuildContext context, e) {
    String errorMessage;

    if (e.message.contains(']')) {
      errorMessage = e.message.split('] ')[1];
    } else {
      errorMessage = e.message;
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Something gets wrong!'),
          content: Text('$errorMessage'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // void showAlert(BuildContext context, List<Playlist> playlists, Playlist playlist) {
  //   TextEditingController _textFieldController = TextEditingController();
  //
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return CupertinoAlertDialog(
  //         title: Text('New playlist'),
  //         content: CupertinoTextField(
  //           controller: _textFieldController,
  //           // placeholder: 'Type something',
  //         ),
  //         actions: <Widget>[
  //           CupertinoDialogAction(
  //             child: Text('Cancel'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //           CupertinoDialogAction(
  //             child: Text('OK'),
  //             onPressed: () {
  //               String playlistName = _textFieldController.text;
  //               playlists.add(Playlist(playlistName, PlaylistValues.custom));
  //               print('Typed Text: $playlistName');
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}