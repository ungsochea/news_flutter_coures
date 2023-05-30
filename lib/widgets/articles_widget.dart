import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:news_flutter_course/services/utils.dart';
import 'package:news_flutter_course/widgets/vertical_spacing.dart';

import '../consts/vars.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
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
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FancyShimmerImage(
                          height: size.height*0.12,
                          width: size.height*0.12,
                          boxFit: BoxFit.fill,
                          imageUrl: "https://i.guim.co.uk/img/media/cd6efbd1bade44704b0b4f1d7a2b72e3a635a823/0_247_5568_3341/master/5568.jpg?width=1200&height=900&quality=85&auto=format&fit=crop&s=1dc4191028d3f1147475a2ea0acc8d6a"
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
                            Text('Title '*100,
                              maxLines: 2,
                              textAlign: TextAlign.justify,
                              overflow:TextOverflow.ellipsis,
                              style: smallTextStyle,
                            ),
                            const VerticalSpacing(5),
                            Align(
                              alignment:Alignment.topRight,
                                child: Text('🕒 Reading Time',style: smallTextStyle,)
                            ),
                            FittedBox(
                              child: Row(
                                children: [
                                  IconButton(onPressed: (){}, icon: const Icon(Icons.link,color: Colors.blue,)),
                                  Text('30 May 2023 '*2,maxLines: 1,style: smallTextStyle,),
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
          ],
        ),
      ),
    );
  }
}
