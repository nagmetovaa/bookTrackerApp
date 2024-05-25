import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/quote_bloc/quote_bloc.dart';
import '../services/repository/quote_repository.dart';
import '../widgets/favorite_quotes/quotes_list.dart';
import '../widgets/title.dart';

class FavoriteQuotes extends StatelessWidget {

  final quoteRepository = QuoteRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleField(),
      ),
      body: BlocProvider<QuoteBloc>(
        create: (context) => QuoteBloc(quoteRepository),
        child: Column(
          children: [
            Container(
              child: QuoteList(),
            )
          ],
        ),
      ),
    );
  }
}

