
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/playlist_book.dart';
import '../../services/repository/playlist_repository.dart';
import 'playlist_event.dart';
import 'playlist_state.dart';

class PlaylistBloc extends Bloc<PlaylistEvent, PlaylistState> {

  final PlaylistRepository playlistRepository;
  // PlaylistBloc(this.playlistRepository) : super(PlaylistLoadState());
  PlaylistBloc(this.playlistRepository) : super(PlaylistLoadState()) {
    initialize();
  }

  void initialize() async {
    add(PlaylistEvent());
  }

  @override
  Stream<PlaylistState> mapEventToState(PlaylistEvent event) async*{
    if (event is PlaylistEvent) {
      // yield PlaylistLoadState();
      try{
        final List<PlaylistBook> _loadedPlaylist = await playlistRepository.getBooksFromPlaylist();
        yield PlaylistLoadedState(loadedPlaylist: _loadedPlaylist);
      }catch (e) {
        yield PlaylistErrorState();
        print('${e}');
      }
    }
  }
}