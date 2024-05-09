 import 'package:bookTracker/widgets/my_library/reading_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bloc/enum_playlist_values.dart';
import '../widgets/my_library/read_list.dart';
import '../widgets/my_library/will_read_list.dart';
import '../widgets/title.dart';

class MyLibrary extends StatefulWidget {

  @override
_MyLibraryState createState() => _MyLibraryState();
}

class _MyLibraryState extends State<MyLibrary> {

  bool _isGroup1Expanded = false;
  bool _isGroup2Expanded = false;
  bool _isGroup3Expanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleField(),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (panelIndex, isExpanded) {
            setState(() {
            });
          },
          children: [
            ExpansionPanel(
              canTapOnHeader: true,
              headerBuilder: (context, isExpanded) {
                return ListTile(
                  onTap: () {
                    setState(() {
                      _isGroup1Expanded = !_isGroup1Expanded;
                    });
                  },
                  title: Text(PlaylistEventHandler.handlePlaylistValue(PlaylistValues.readList)),
                );
              },
              body: ParentReadList(),
              isExpanded: _isGroup1Expanded,

            ),
            ExpansionPanel(
              canTapOnHeader: true,
              headerBuilder: (context, isExpanded) {
                return ListTile(
                  onTap: () {
                    setState(() {
                      _isGroup2Expanded = !_isGroup2Expanded;
                    });
                  },
                  title: Text(PlaylistEventHandler.handlePlaylistValue(PlaylistValues.readingList)),
                );
              },
              body: ParentReadingList(),
              isExpanded: _isGroup2Expanded,
            ),
            ExpansionPanel(
              canTapOnHeader: true,
              headerBuilder: (context, isExpanded) {
                return ListTile(
                  onTap: () {
                    setState(() {
                      _isGroup3Expanded = !_isGroup3Expanded;
                    });
                    },
                  title: Text(PlaylistEventHandler.handlePlaylistValue(PlaylistValues.willReadList)),
                );
              },
              body: ParentWillReadList(),
              isExpanded: _isGroup3Expanded,
            ),
          ],
        ),
      ),
    );
  }
}

