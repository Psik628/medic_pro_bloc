import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../domain/subject/article.dart';
import '../../core/app_bar.dart';
import '../../ui_constants.dart';

class ArticleConstants{
  static String heading1 = 'isHeading1';
  static String heading2 = 'isHeading2';
  static String heading3 = 'isHeading3';

  // new heading implementation
  static String heading1Start = 'h1/';
  static String heading2Start = 'h2/';
  static String heading3Start = 'h3/';

  // new list implementation
  static String listStart = 'li/';

  // new image implementation
  static String imageStart = '/image';

  static String isPartOfList = 'isPartOfList';
  static String isImage = 'isImage';
  static String boldStarter = '*';

  static String listSeparator = '◾';

  static String content = 'content';
}

class ArticlePage extends StatelessWidget {

  final Article currentArticle;

  const ArticlePage({Key? key, required this.currentArticle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar.returnAppBar(),
        body: SafeArea(
          minimum: EdgeInsets.symmetric(
            vertical: UIConstants.safeAreaPaddingVertical,
            horizontal: UIConstants.safeAreaPaddingHorizontal
          ),
        child: Column(
          children: [
            Center(
              child: Text(
                  currentArticle.title,
              ),
            ),
          ],
        )
      )
    );
  }
}
