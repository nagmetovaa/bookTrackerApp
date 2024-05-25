class Quote{
  String authorName;
  String title;
  String isbn;
  String quote;

  Quote({required this.authorName,
    required this.title,
    required this.isbn,
    required this.quote,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
        authorName: json['author_name'],
        title: json['title'],
        isbn: json['isbn'],
        quote: json['quote']
    );
  }
}