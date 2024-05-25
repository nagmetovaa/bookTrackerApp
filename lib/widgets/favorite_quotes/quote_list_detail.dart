import 'package:bookTracker/models/quote.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dart_quote/widget_quote.dart';
import 'package:dart_quote/string_quote.dart';
import '../title.dart';

class QuoteListDetail extends StatelessWidget{

  final List<dynamic>? quoteList;
  final String isbn;

  const QuoteListDetail({super.key, required this.quoteList, required this.isbn});

  @override
  Widget build (BuildContext context) {

    List<Quote> filteredQuotes = [];

    for (var quote in quoteList!) {
      if (isbn.contains(quote.isbn.toString())) {
        filteredQuotes.add(quote);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: TitleField(),
      ),
      body: ListView.builder(
          shrinkWrap: false,
          itemCount: filteredQuotes?.length,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
            ListTile(
            title: WidgetQuote(text:'${filteredQuotes?[index].quote}',).quote()
            ),
                Divider(
                  color: Colors.cyan[700],
                  thickness: 1.0,
                ),
              ],
            );
          }),


    );
  }
}