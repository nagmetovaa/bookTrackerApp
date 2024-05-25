import 'package:bookTracker/bloc/playlist_bloc/playlist_bloc.dart';
import 'package:bookTracker/services/repository/playlist_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/playlist_bloc/playlist_event.dart';
import '../../bloc/playlist_bloc/playlist_state.dart';
import 'my_popup_menu_button.dart';

class ParentWillReadList extends StatelessWidget {
  final PlaylistRepository playlistRepository = PlaylistRepository();
  final PlaylistBloc playlistBloc = PlaylistBloc(PlaylistRepository());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlaylistBloc(playlistRepository),
      child: Container(
        child: WillReadList(playlistBloc: playlistBloc),
      ),
    );
  }
}


class WillReadList extends StatefulWidget{

  final PlaylistBloc playlistBloc;

  WillReadList({required this.playlistBloc});

  @override
  _WillReadListState createState() => _WillReadListState();
}

class _WillReadListState extends State<WillReadList> {
  late PlaylistBloc _playlistBloc;

  @override
  void initState() {
    super.initState();
    _playlistBloc = widget.playlistBloc;
    _playlistBloc.add(PlaylistEvent());

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<PlaylistBloc, PlaylistState>(
        builder: (context, state) {
          if (state is PlaylistLoadState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PlaylistLoadedState) {
            return CustomScrollView(
              shrinkWrap: true,
              slivers: [
                SliverList(delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    if (state.loadedPlaylist?[index].playlist == '3') {
                      return ListTile(
                        leading: Image.network(
                          'http://covers.openlibrary.org/b/isbn/${state.loadedPlaylist?[index].isbn}.jpg',
                          width: 84.0,
                          height: 84.0,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.error_outline);
                          },
                        ),
                        title: Text(state.loadedPlaylist?[index].title),
                        subtitle: Text(
                            state.loadedPlaylist?[index].authorName),
                        trailing: MyPopupMenuButton.showPopupMenu(context,state.loadedPlaylist?[index].title,state.loadedPlaylist?[index].authorName, state.loadedPlaylist?[index].isbn, showOption: true),
                      );
                    }else{
                      return Container();
                    }
                  },
                  childCount: state.loadedPlaylist?.length ?? 0,
                ),
                )
              ],
            );
          } else if (state is PlaylistErrorState) {
            return Center(child: Text('Error'));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}