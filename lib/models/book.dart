
class Book{
  String authorName;
  String title;
  String isbn;

  Book({required this.authorName,
        required this.title,
        required this.isbn,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        authorName: json['author_name'],
        title: json['title'],
        isbn: json['isbn']
    );
  }
}