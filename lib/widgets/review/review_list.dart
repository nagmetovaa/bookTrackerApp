import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/review_bloc/review_bloc.dart';
import '../../bloc/review_bloc/review_state.dart';


class ReviewList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewBloc, ReviewState>(
        builder: (context, state) {
          if (state is ReviewEmptyState) {
            return Center(
              child: Text('No review found or problem with the internet',
                style: TextStyle(fontSize: 20.0),),
            );
          }

          if(state is ReviewLoadedState) {
            return Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverList(delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        return ListTile(
                          leading: Image.network(
                            'http://covers.openlibrary.org/b/isbn/${state.loadedReviewList?[index].isbn}.jpg',
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
                                child: Text('${state.loadedReviewList?[index].title}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),),
                              ),
                            ],
                          ),
                          subtitle:
                          Text('${state.loadedReviewList?[index].review}', style: TextStyle(
                            fontSize: 17,
                          ),),
                        );
                      },
                      childCount: state.loadedReviewList?.length,
                    )
                    )
                  ],
                )
            );
          }
          if (state is ReviewErrorState) {
            return Center(
              child: Text('Something will happen, check the connection',
                style: TextStyle(fontSize: 20.0),),
            );
          }
          return SizedBox();
        }
    );

  }

}