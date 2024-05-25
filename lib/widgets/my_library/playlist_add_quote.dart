
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../services/repository/quote_repository.dart';
import '../../services/repository/review_repository.dart';

class PlaylistAddQuote {

  late String _textInput;

  void showAddQuoteDialog(BuildContext context, String title, String authorName, String ISBN) {
    Navigator.of(context).push(
      CupertinoPageRoute<void>(
        fullscreenDialog: true,
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Add the favorite quote'),
            ),
            body: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text('Title: ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.cyan[700],
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text('Write a quote',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CupertinoTextField(
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    padding: EdgeInsets.symmetric(vertical: 40.0),
                    onChanged: (String value) {
                      _textInput = value;
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  CupertinoButton(
                      child: Text('Save',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        QuoteRepository().addQuote(title, authorName, ISBN, _textInput);
                        Navigator.pop(context);
                      }
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}






