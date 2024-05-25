import 'package:bookTracker/bloc/quote_bloc/quote_bloc.dart';
import 'package:bookTracker/bloc/quote_bloc/quote_state.dart';
import 'package:bookTracker/widgets/favorite_quotes/quote_list_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../models/quote.dart';

class QuoteList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuoteBloc, QuoteState>(
        builder: (context, state) {
          if (state is QuoteEmptyState) {
            return Center(
              child: Lottie.asset(
                'assets/quote/animation_quote.json',
                height: 300,
                width: 300,
                reverse: true,
                animate: true,
              ),
            );
          }

          if(state is QuoteLoadedState) {

            Map<String, dynamic> groupedData = groupQuotesByTitle((state.loadedQuoteList ?? []) as List<Quote>);
            List<String> titles = groupedData.keys.toList();
            return Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            String title = titles[index];
                            String imageUrl = groupedData[title]['imageUrl'];
                            // String isbn = groupedData[title]['isbn'];

                        return Column(
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                              ListTile(
                                leading: Image.network(
                                  imageUrl,
                                  width: 84.0,
                                  height: 84.0,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(Icons.error_outline);
                                  },
                                ),
                                title: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        title,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                                trailing: CupertinoButton(
                                  child: Icon(Icons.arrow_forward_ios),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) => QuoteListDetail(quoteList: state.loadedQuoteList,isbn: groupedData[title]['isbn'].toString(),),
                                        ),
                                    );
                                    // print((groupedData[title]['isbn']));
                                  },
                                ),
                          ),
                            Divider(
                              color: Colors.cyan[700],
                              thickness: 1.0,
                            ),
                          ],
                        );
                      },
                      childCount: groupedData.length,
                    ),
                  ),
                ],
              ),
            );
          }
          if (state is QuoteErrorState) {
            return Center(
              child: Text('Something will happen, check the connection',
                style: TextStyle(fontSize: 20.0),),
            );
          }
          return SizedBox();
        }
    );

  }

  Map<String, dynamic> groupQuotesByTitle(List<Quote> quotes) {
    Map<String, dynamic> groupedData = {};
    for (Quote quote in quotes) {
      String title = quote.title;
      if (!groupedData.containsKey(title)) {
        groupedData[title] = {'quotes': [quote], 'imageUrl': 'http://covers.openlibrary.org/b/isbn/${quote.isbn}.jpg', 'isbn': [quote.isbn]};
      } else {
        groupedData[title]['quotes'].add(quote);
      }
    }
    return groupedData;
  }

}