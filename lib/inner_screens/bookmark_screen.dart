import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_flutter_course/services/utils.dart';
import 'package:news_flutter_course/widgets/articles_widget.dart';
import 'package:news_flutter_course/widgets/empty_screen.dart';
import 'package:page_transition/page_transition.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).getColor;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          centerTitle: true,
          iconTheme: IconThemeData(color: color),
          title: Text(
            'Bookmark',
            style: GoogleFonts.lobster(
                color: color,
                textStyle: const TextStyle(fontSize: 20, letterSpacing: 0.6)),
          ),
        ),
        body: const EmptyNewsWidget(
            text: "You didn\'t add any yet to your bookmark.",
            imagePath: "assets/images/bookmark.png")
        // ListView.builder(
        //     itemCount: 20,
        //     itemBuilder: (ctx, index) {
        //       return const ArticleWidget();
        //     }),
        );
  }
}
