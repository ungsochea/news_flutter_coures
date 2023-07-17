import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_flutter_course/inner_screens/blog_details.dart';
import 'package:news_flutter_course/inner_screens/news_detail.dart';
import 'package:news_flutter_course/models/news_models.dart';
import 'package:news_flutter_course/services/utils.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class TopTrendingWidget extends StatelessWidget {
  const TopTrendingWidget({super.key});
  // final String url;
  @override
  Widget build(BuildContext context) {
    final size = Utils(context).getScreenSize;
    final Color color = Utils(context).getColor;
    final newsModelProvider = Provider.of<NewsModel>(context);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, BlogDetailScreen.routeName,
              arguments: newsModelProvider.publishedAt);
        },
        child: Material(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12.0),
          child: Column(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Hero(
                tag: newsModelProvider.publishedAt,
                child: FancyShimmerImage(
                  boxFit: BoxFit.fill,
                  errorWidget: Image.asset('assets/images/empty_image.png'),
                  imageUrl: newsModelProvider.urlToImage,
                  height: size.height * 0.33,
                  width: double.infinity,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  newsModelProvider.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: NewDetilScreen(url: newsModelProvider.url),
                          inheritTheme: true,
                          ctx: context),
                    );
                  },
                  icon: const Icon(Icons.link),
                ),
                const Spacer(),
                SelectableText(
                  newsModelProvider.dateToshow,
                  style: GoogleFonts.montserrat(fontSize: 15),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
