abstract class QuoteState {}


class QuoteEmptyState extends QuoteState {}

class QuoteLoadedState extends QuoteState {
  List <dynamic>? loadedQuoteList;
  QuoteLoadedState({required this.loadedQuoteList}) : assert(loadedQuoteList != null);
}
class QuoteErrorState extends QuoteState {
  print(e) {
    throw UnimplementedError();
  }
}