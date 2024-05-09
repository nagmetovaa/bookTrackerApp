import 'package:bookTracker/services/repository/review_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/review_bloc/review_bloc.dart';
import '../widgets/review/review_list.dart';
import '../widgets/title.dart';

class MyReview extends StatefulWidget {

  @override
  _MyReviewState createState() => _MyReviewState();
}

class _MyReviewState extends State<MyReview> {

  final reviewRepository = ReviewRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleField(),
      ),
      body: BlocProvider<ReviewBloc>(
        create: (context) => ReviewBloc(reviewRepository),
        child: Column(
          children: [
            Container(
              child: ReviewList(),
            )
          ],
        ),
      ),
    );
  }
}

