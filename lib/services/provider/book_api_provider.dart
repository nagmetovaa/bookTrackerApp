import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bookTracker/models/book.dart';

class BookProvider {


 Future<List<Book>?> getBookList(String query) async {
  final Uri url = Uri.parse('http://openlibrary.org/search.json?q=$query');
  try {
   final response = await http.get(url);
   if (response.statusCode == 200) {
    var jsonData = json.decode(response.body) as Map<String, dynamic>;
    final List<dynamic> bookDataList = jsonData['docs'];
    if (bookDataList != null) {
     final List<Book> parsedbookData = bookDataList
         .map((data) => Book.fromJson(Map<String, dynamic>.from(data.map((key, value) => MapEntry(key, value is List ? value.first : value)))))
         .toList();
     return parsedbookData;

    } else {
     throw Exception('Failed to load books!');
    }
  }
  }catch (error) {
   throw Exception('Failed to fetch data: $error');
  }
 }
}