import 'package:bookTracker/widgets/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../pages/my_library.dart';

class TitleField extends StatelessWidget{

 final bool showAddOption;
 // final List<Playlist>? playlists;

 const TitleField({Key? key, this.showAddOption = false})  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
       Expanded(
           child: Text('Hello',
             textAlign: TextAlign.start,),),
        CupertinoButton(
            child: Icon(Icons.notifications),
            onPressed: () {}),
        CupertinoButton(
            child: Icon(Icons.settings),
            onPressed: () {}),
        if (showAddOption)
          CupertinoButton(
              child: Icon(Icons.add),
              onPressed: () {
                // MyMessages().showAlert(context, playlists!);
              })
      ],
    );
  }
}