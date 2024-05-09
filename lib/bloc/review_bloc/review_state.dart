abstract class ReviewState{}


class ReviewEmptyState extends ReviewState {}

class ReviewLoadedState extends ReviewState {
  List <dynamic>? loadedReviewList;
  ReviewLoadedState({required this.loadedReviewList}) : assert(loadedReviewList != null);
}
class ReviewErrorState extends ReviewState {
  print(e) {
    throw UnimplementedError();
  }
}