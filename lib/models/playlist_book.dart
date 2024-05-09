
class PlaylistBook{
  String authorName;
  String title;
  String isbn;
  String playlist;

  PlaylistBook({required this.authorName,
    required this.title,
    required this.isbn,
    required this.playlist,
  });

  factory PlaylistBook.fromJson(Map<String, dynamic> json) {
    return PlaylistBook(
        authorName: json['author_name'],
        title: json['title'],
        isbn: json['isbn'],
        playlist: json['playlist']
    );
  }
}