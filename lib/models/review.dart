class Review{
  String authorName;
  String title;
  String isbn;
  String review;

  Review({required this.authorName,
    required this.title,
    required this.isbn,
    required this.review,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
        authorName: json['author_name'],
        title: json['title'],
        isbn: json['isbn'],
        review: json['review']
    );
  }
}