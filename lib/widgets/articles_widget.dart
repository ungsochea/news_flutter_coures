import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:news_flutter_course/inner_screens/blog_details.dart';
import 'package:news_flutter_course/inner_screens/news_detail.dart';
import 'package:news_flutter_course/services/utils.dart';
import 'package:news_flutter_course/widgets/vertical_spacing.dart';
import 'package:page_transition/page_transition.dart';

import '../consts/vars.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.url,
      required this.dateToShow,
      required this.readingTime})
      : super(key: key);
  final String imageUrl, title, url, dateToShow, readingTime;
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor,
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, BlogDetailScreen.routeName);
          },
          child: Stack(
            children: [
              Container(
                height: 60,
                width: 60,
                color: Theme.of(context).colorScheme.secondary,
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  height: 60,
                  width: 60,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              Container(
                color: Theme.of(context).cardColor,
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FancyShimmerImage(
                          height: size.height * 0.12,
                          width: size.height * 0.12,
                          boxFit: BoxFit.fill,
                          imageUrl: imageUrl),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 2,
                          textAlign: TextAlign.justify,
                          overflow: TextOverflow.ellipsis,
                          style: smallTextStyle,
                        ),
                        const VerticalSpacing(5),
                        Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              '🕒 $readingTime',
                              style: smallTextStyle,
                            )),
                        FittedBox(
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.rightToLeft,
                                          child: NewDetilScreen(
                                            url: url,
                                          ),
                                          inheritTheme: true,
                                          ctx: context),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.link,
                                    color: Colors.blue,
                                  )),
                              Text(
                                dateToShow,
                                maxLines: 1,
                                style: smallTextStyle,
                              ),
                            ],
                          ),
                        )
                      ],
                    ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
