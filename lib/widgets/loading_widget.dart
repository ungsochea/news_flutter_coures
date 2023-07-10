import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_flutter_course/services/utils.dart';
import 'package:news_flutter_course/widgets/vertical_spacing.dart';
import 'package:shimmer/shimmer.dart';

import '../consts/vars.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({Key? key, required this.newsType}) : super(key: key);
  final NewsType newsType;
  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  BorderRadius borderRadius = BorderRadius.circular(18);
  late Color baseShimmerColor, highlightShimmerColor,widgetShimmerColor;

  @override
  void didChangeDependencies() {
    var utils = Utils(context);
    baseShimmerColor = utils.baseShimmerColor;
    highlightShimmerColor = utils.highlightShimmerColor;
    widgetShimmerColor = utils.widgetShimmerColor;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;

    return widget.newsType == NewsType.topTrading ? Swiper(
        autoplay: true,
        autoplayDelay: 8000,
        itemWidth: size.width * 0.9,
        layout: SwiperLayout.STACK,
        viewportFraction: 0.9,
        itemCount: 5,
        itemBuilder: (context, index){
          return TopTrendingLoadinWidget(baseShimmerColor: baseShimmerColor, highlightShimmerColor: highlightShimmerColor, size: size, borderRadius: borderRadius, widgetShimmerColor: widgetShimmerColor);
        }
      ):
    Expanded(
          child: ListView.builder(
              itemCount: 20,
              itemBuilder: (ctx,index){
                return ArticlesShimmerEffectWidget(baseShimmerColor: baseShimmerColor, highlightShimmerColor: highlightShimmerColor, size: size, borderRadius: borderRadius);
              }
          )
    );
  }
}

class TopTrendingLoadinWidget extends StatelessWidget {
  const TopTrendingLoadinWidget({
    super.key,
    required this.baseShimmerColor,
    required this.highlightShimmerColor,
    required this.size,
    required this.borderRadius,
    required this.widgetShimmerColor,
  });

  final Color baseShimmerColor;
  final Color highlightShimmerColor;
  final Size size;
  final BorderRadius borderRadius;
  final Color widgetShimmerColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
          decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Shimmer.fromColors(
            baseColor: baseShimmerColor,
            highlightColor: highlightShimmerColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                    height: size.height*0.33,
                    width: double.infinity,
                    color: baseShimmerColor,
                  ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: borderRadius,
                    color: widgetShimmerColor
                  ),
                  width: double.infinity,
                  height: size.height * 0.06,
                  
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                     Container(
                      decoration: BoxDecoration(
                        borderRadius: borderRadius,
                        color: widgetShimmerColor
                      ),
                      height: size.height * 0.04,
                      width: size.width * 0.12,
                    ),
                    // IconButton(onPressed: () async {}, 
                    //   icon: const Icon(Icons.link),
                    // ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: borderRadius,
                        color: widgetShimmerColor
                      ),
                      height: size.height * 0.04,
                      width: size.width * 0.5,
                    ),
                  ],
                ),
              )  
            ]),
        ),
      ),
    );
  }
}


class ArticlesShimmerEffectWidget extends StatelessWidget {
  const ArticlesShimmerEffectWidget({
    super.key,
    required this.baseShimmerColor,
    required this.highlightShimmerColor,
    required this.size,
    required this.borderRadius,
  });

  final Color baseShimmerColor;
  final Color highlightShimmerColor;
  final Size size;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor,
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
            InkWell(
              onTap: (){print('ok');},
              child: Container(
                color: Theme.of(context).cardColor,
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.all(10.0),
                child: Shimmer.fromColors(
                  baseColor: baseShimmerColor,
                  highlightColor: highlightShimmerColor,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                            height: size.height*0.12,
                            width: size.height*0.12,
                            color: Colors.red,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: size.height*0.06,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: borderRadius,
                                  color: Colors.red
                                ),
                              ),
                              const VerticalSpacing(5),
                              Align(
                                alignment:Alignment.topRight,
                                  child: Container(
                                    height: size.height*0.025,
                                    width: size.width*0.4,
                                    decoration: BoxDecoration(
                                        borderRadius: borderRadius,
                                        color: Colors.red
                                    ),
                                  ),
                              ),
                              FittedBox(
                                child: Row(
                                  children: [
                                    ClipOval(
                                      child: Container(
                                        height: 25,
                                        width: 25,
                                        color: Colors.red,
                                      ),
                                    ),
                                    const SizedBox(width: 5,),
                                    Container(
                                      height: size.height*0.025,
                                      width: size.width*0.4,
                                      decoration: BoxDecoration(
                                          borderRadius: borderRadius,
                                          color: Colors.red
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 