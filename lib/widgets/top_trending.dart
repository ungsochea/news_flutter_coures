import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_flutter_course/inner_screens/blog_details.dart';
import 'package:news_flutter_course/inner_screens/news_detail.dart';
import 'package:news_flutter_course/services/utils.dart';
import 'package:page_transition/page_transition.dart';

class TopTrendingWidget extends StatelessWidget {
  const TopTrendingWidget({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    final size = Utils(context).getScreenSize;
    final Color color = Utils(context).getColor;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, BlogDetailScreen.routeName);
        },
        child: Material(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12.0),
          child: Column(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: FancyShimmerImage(
                boxFit: BoxFit.fill,
                errorWidget: Image.asset('assets/images/empty_image.png'),
                imageUrl:
                    "https://techcrunch.com/wp-content/uploads/2023/07/ETH-zurich-pixar-smoke.jpg",
                height: size.height * 0.33,
                width: double.infinity,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Title',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
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
                          child: NewDetilScreen(url: url),
                          inheritTheme: true,
                          ctx: context),
                    );
                  },
                  icon: const Icon(Icons.link),
                ),
                const Spacer(),
                SelectableText(
                  "10-07-2023",
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
