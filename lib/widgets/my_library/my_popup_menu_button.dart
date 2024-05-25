import 'package:flutter/material.dart';

import '../../bloc/enum_menu_values.dart';
import '../../bloc/menu_event_handler.dart';


class MyPopupMenuButton {
  static PopupMenuButton<MenuValues> showPopupMenu(BuildContext context, String title, String authorName, String ISBN, {bool showOption = false}) {
    return PopupMenuButton<MenuValues>(
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          child: Text('Add to playlist'),
          value: MenuValues.addToPlaylist,
        ),
        PopupMenuItem(
          child: Text('Write a review'),
          value: MenuValues.writeReview,
        ),
        if (showOption)
          PopupMenuItem(
            child: Text('Add a quote'),
            value: MenuValues.addQuote,
          ),
        PopupMenuItem(
          child: Text('Share'),
          value: MenuValues.share,
        ),
        if (showOption)
          PopupMenuItem(
            child: Text('Delete from playlist'),
            value: MenuValues.delete,
          ),
      ],
      onSelected: (value) {
        MenuEventHandler.handleMenuValue(context, title, authorName, ISBN, value);
      },
    );
  }
}
