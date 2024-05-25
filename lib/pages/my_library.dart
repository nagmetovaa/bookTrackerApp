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
          dividerColor: Colors.cyan[700],
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


 // class Playlist {
 //   final String name;
 //   final PlaylistValues type;
 //
 //   Playlist(this.name, this.type);
 // }
 //
 // class MyLibrary extends StatefulWidget {
 //   @override
 //   _MyLibraryState createState() => _MyLibraryState();
 // }

 // class _MyLibraryState extends State<MyLibrary> {
 //   List<Playlist> playlists = [
 //     Playlist('Read List', PlaylistValues.readList),
 //     Playlist('Reading List', PlaylistValues.readingList),
 //     Playlist('Will Read List', PlaylistValues.willReadList),
 //   ];
 //
 //   bool _isGroup1Expanded = false;
 //   bool _isGroup2Expanded = false;
 //   bool _isGroup3Expanded = false;
 //
 //   @override
 //   Widget build(BuildContext context) {
 //     return Scaffold(
 //       appBar: AppBar(
 //         title: TitleField(showAddOption: true, playlists: playlists,),
 //       ),
 //       body: SingleChildScrollView(
 //         child: ExpansionPanelList(
 //           dividerColor: Colors.cyan[700],
 //           expansionCallback: (panelIndex, isExpanded) {
 //             setState(() {});
 //           },
 //           children: [
 //             for (var playlist in playlists)
 //               ExpansionPanel(
 //                 canTapOnHeader: true,
 //                 headerBuilder: (context, isExpanded) {
 //                   return ListTile(
 //                     onTap: () {
 //                       setState(() {
 //                         _toggleExpansion(playlist.type);
 //                       });
 //                     },
 //                     title: Text(PlaylistEventHandler.handlePlaylistValue(playlist.type)),
 //                   );
 //                 },
 //                 body: _buildPlaylistWidget(playlist.type),
 //                 isExpanded: _isExpanded(playlist.type),
 //               ),
 //           ],
 //         ),
 //       ),
 //     );
 //   }
 //
 //   bool _isExpanded(PlaylistValues type) {
 //     if (type == PlaylistValues.readList) {
 //       return _isGroup1Expanded;
 //     } else if (type == PlaylistValues.readingList) {
 //       return _isGroup2Expanded;
 //     } else if (type == PlaylistValues.willReadList) {
 //       return _isGroup3Expanded;
 //     }
 //     return false;
 //   }
 //
 //   void _toggleExpansion(PlaylistValues type) {
 //     if (type == PlaylistValues.readList) {
 //       _isGroup1Expanded = !_isGroup1Expanded;
 //     } else if (type == PlaylistValues.readingList) {
 //       _isGroup2Expanded = !_isGroup2Expanded;
 //     } else if (type == PlaylistValues.willReadList) {
 //       _isGroup3Expanded = !_isGroup3Expanded;
 //     }
 //   }
 //
 //   // void _addPlaylist(String playlistName) {
 //   //   setState(() {
 //   //     playlists.add(Playlist(playlistName, PlaylistValues.custom));
 //   //   });
 //   // }
 //
 //   Widget _buildPlaylistWidget(PlaylistValues type) {
 //     switch (type) {
 //       case PlaylistValues.readList:
 //         return ParentReadList();
 //       case PlaylistValues.readingList:
 //         return ParentReadingList();
 //       case PlaylistValues.willReadList:
 //         return ParentWillReadList();
 //       default:
 //         return Container();
 //     }
 //   }
 // }
 //
 // class _MyLibraryState extends State<MyLibrary> {
 //   List<Playlist> playlists = [
 //     Playlist('Read List', PlaylistValues.readList),
 //     Playlist('Reading List', PlaylistValues.readingList),
 //     Playlist('Will Read List', PlaylistValues.willReadList),
 //   ];
 //
 //   @override
 //   Widget build(BuildContext context) {
 //     return Scaffold(
 //       appBar: AppBar(
 //         title: TitleField(showAddOption: true),
 //       ),
 //       body: SingleChildScrollView(
 //         child: ExpansionPanelList.radio(
 //           dividerColor: Colors.cyan[700],
 //           expandedHeaderPadding: EdgeInsets.zero,
 //           elevation: 0,
 //           initialOpenPanelValue: playlists.first, // Здесь используем первый плейлист из списка для открытия по умолчанию
 //           children: playlists.map((playlist) {
 //             return ExpansionPanelRadio(
 //               value: playlist,
 //               headerBuilder: (context, isExpanded) {
 //                 return ListTile(
 //                   title: Text(playlist.name),
 //                 );
 //               },
 //               body: _buildPlaylistWidget(playlist.type),
 //             );
 //           }).toList(),
 //         ),
 //       ),
 //     );
 //   }
 //
 //   Widget _buildPlaylistWidget(PlaylistValues type) {
 //     switch (type) {
 //       case PlaylistValues.readList:
 //         return ParentReadList();
 //       case PlaylistValues.readingList:
 //         return ParentReadingList();
 //       case PlaylistValues.willReadList:
 //         return ParentWillReadList();
 //       default:
 //         return Container();
 //     }
 //   }
 // }
