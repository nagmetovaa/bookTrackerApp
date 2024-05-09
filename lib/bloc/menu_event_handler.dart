import 'package:bookTracker/widgets/my_library/share.dart';
import 'package:flutter/cupertino.dart';

import '../widgets/my_library/delete_alert.dart';
import '../widgets/my_library/playlist_action_sheet.dart';
import '../widgets/my_library/playlist_write_review.dart';
import 'enum_menu_values.dart';

class MenuEventHandler {
  static void handleMenuValue(BuildContext context,String title, String authorName, String ISBN, MenuValues value) {
    switch (value) {
      case MenuValues.addToPlaylist:
        PlaylistActionSheet().showModalWindow(context, title, authorName,ISBN);
        break;
      case MenuValues.writeReview:
        PlaylistWriteReview().showInputDialog(context, title, authorName,ISBN);
        break;
      case MenuValues.share:
        ShareToContact().shareOnPressed(title, authorName, ISBN);
        break;
      case MenuValues.delete:
        DeleteAlertDialog.showConfirmationDialog(context, 'Confirmation', 'Are you sure you want to delete $title from your playlist?', ISBN);
        break;
    }
  }
}