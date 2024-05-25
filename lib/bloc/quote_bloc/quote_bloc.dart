import 'package:bookTracker/bloc/quote_bloc/quote_event.dart';
import 'package:bookTracker/bloc/quote_bloc/quote_state.dart';
import 'package:bookTracker/bloc/review_bloc/review_event.dart';
import 'package:bookTracker/bloc/review_bloc/review_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/quote.dart';
import '../../services/repository/quote_repository.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {

  final QuoteRepository quoteRepository;

  QuoteBloc(this.quoteRepository) : super(QuoteEmptyState()) {
    initialize();
  }

  void initialize() async {
    add(QuoteEvent());
  }

  @override
  Stream<QuoteState> mapEventToState(QuoteEvent event) async*{
    if (event is QuoteEvent) {
      try{
        final List<Quote>? _loadedQuoteList = await quoteRepository.getQuote();
        yield QuoteLoadedState(loadedQuoteList: _loadedQuoteList);
      }catch (e) {
        yield QuoteErrorState();
        print('${e}');
      }
    }
  }
}
