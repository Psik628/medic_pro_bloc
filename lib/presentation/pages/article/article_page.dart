import 'package:easy_localization/easy_localization.dart';
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
              child: Text(currentArticle.title).tr(),
            ),
            ...currentArticle.content.map((snippet){
              
              String snippetString = snippet[ArticleConstants.content].toString();

              if(snippetString.startsWith(ArticleConstants.heading1Start) || snippetString.startsWith(ArticleConstants.heading2Start) || snippetString.startsWith(ArticleConstants.heading3Start)){
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      snippetString.substring(3),
                      style: TextStyle(
                          fontWeight: snippetString.startsWith(ArticleConstants.heading1Start) ? UIConstants.articlePageH1FontWeight : snippetString.startsWith(ArticleConstants.heading2Start) ? UIConstants.articlePageH2FontWeight : UIConstants.articlePageH3FontWeight,
                          fontSize: snippetString.startsWith(ArticleConstants.heading1Start) ? UIConstants.articlePageH1FontSize : snippetString.startsWith(ArticleConstants.heading2Start) ?  UIConstants.articlePageH1FontSize : UIConstants.articlePageH3FontSize
                      )
                  ),
                );
              }else if(snippetString.contains(ArticleConstants.boldStarter)){
                // is bold text
                String snippetContent = snippet[ArticleConstants.content].toString();
                // splitting to every word
                List<String> contentParts = snippetContent.split(' ');

                return Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: UIConstants.articlePageNormalTextFontSize,
                      ),
                      children: <TextSpan>[
                        ...contentParts.map((content) {
                          return TextSpan(
                              text: "${content.replaceAll(ArticleConstants.boldStarter, '')} ",
                              style: TextStyle(fontWeight: (content.toString().startsWith(ArticleConstants.boldStarter) || content.toString().endsWith(ArticleConstants.boldStarter)) ? FontWeight.bold : FontWeight.normal)
                          );
                        })
                      ],
                    ),
                  ),
                );
              }else if(snippetString.startsWith(ArticleConstants.imageStart)){

                // todo implement this
                // return FutureBuilder(
                //     future: FirebaseStorage.instance.ref(snippet[ArticleConstants.content].toString().replaceFirst(ArticleConstants.imageStart,'')).getDownloadURL(),
                //     builder: ((BuildContext context, AsyncSnapshot<String> snapshot){
                //       if(!snapshot.hasData) {
                //         return Container(
                //             width: MediaQuery.of(context).size.width,
                //             height: defaultImageHeight,
                //             child: const GFLoader()
                //         );
                //       }
                //       if(snapshot.hasError){
                //         if (kDebugMode) {
                //           print(snapshot.error);
                //         }
                //         return Text(SOMETHING_WENT_WRONG);
                //       }
                //
                //       return Container(
                //         width: MediaQuery.of(context).size.width,
                //         height: defaultImageHeight,
                //         child: Image.network(
                //             snapshot.data!,
                //             fit: BoxFit.contain
                //         ),
                //       );
                //     })
                // );
                return const Text("placeholder image");
              } else if(snippetString.startsWith(ArticleConstants.listStart)){
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    ArticleConstants.listSeparator + snippetString.replaceFirst(ArticleConstants.listStart,'')
                  ),
                );
              } else{
                // is normal text
                return
                  Align(
                    alignment: Alignment.centerRight,
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: UIConstants.articlePageNormalTextFontSize,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: snippet[ArticleConstants.content],
                          )
                        ],
                      ),
                    ),
                  );
              }
              }
            )
          ],
        )
      )
    );
  }
}
