abstract class PlaylistState{}


class PlaylistLoadState extends PlaylistState {}

class PlaylistLoadedState extends PlaylistState {
  List <dynamic>? loadedPlaylist;
  PlaylistLoadedState({required this.loadedPlaylist}) : assert(loadedPlaylist != null);
}
class PlaylistErrorState extends PlaylistState {
  print(e) {
    throw UnimplementedError();
  }
}