import 'package:bookTracker/bloc/review_bloc/review_event.dart';
import 'package:bookTracker/bloc/review_bloc/review_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/review.dart';
import '../../services/repository/review_repository.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {

  final ReviewRepository reviewRepository;

  ReviewBloc(this.reviewRepository) : super(ReviewEmptyState()) {
    initialize();
  }

  void initialize() async {
    add(ReviewEvent());
  }

  @override
  Stream<ReviewState> mapEventToState(ReviewEvent event) async*{
    if (event is ReviewEvent) {
      // yield BookLoadState();
      try{
        final List<Review>? _loadedReviewList = await reviewRepository.getReview();
        yield ReviewLoadedState(loadedReviewList: _loadedReviewList);
      }catch (e) {
        yield ReviewErrorState();
        print('${e}');
      }
    }
  }
}
