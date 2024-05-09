import 'package:bookTracker/bloc/data_bloc/book_bloc.dart';
import 'package:bookTracker/bloc/data_bloc/book_state.dart';
import 'package:bookTracker/widgets/all_books/welcome_gif.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../my_library/my_popup_menu_button.dart';

// enum _MenuValues {
//   addToPlaylist,
//   writeReview,
//   share
// }

class BookList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookBloc, BookState>(
        builder: (context, state) {
          if (state is BookEmptyState) {
            return Center(
              child:
              Text('No data found or problem with the internet',
              style: TextStyle(fontSize: 20.0),),
            );
          }

          if (state is BookLoadState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if(state is BookLoadedState) {
            return Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverList(delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        return ListTile(
                          leading: Image.network(
                            'http://covers.openlibrary.org/b/isbn/${state.loadedBook?[index].isbn}.jpg',
                            width: 84.0,
                            height: 84.0,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.error_outline);
                            },
                          ),
                          //Icon(Icons.account_box_sharp, size:84.0,),
                          title: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 5,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('${state.loadedBook?[index].title}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),),
                              ),
                            ],
                          ),
                          subtitle:
                          Text('${state.loadedBook?[index].authorName}', style: TextStyle(
                            fontSize: 17,
                          ),),
                          trailing: MyPopupMenuButton.showPopupMenu(context,state.loadedBook?[index].title,state.loadedBook?[index].authorName, state.loadedBook?[index].isbn),
                          //
                        );
                      },
                      childCount: state.loadedBook?.length,
                    )
                    )
                  ],
                )
            );
          }

          if (state is BookErrorState) {
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