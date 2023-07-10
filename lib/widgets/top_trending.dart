import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_flutter_course/services/utils.dart';

class TopTrendingWidget extends StatelessWidget {
  const TopTrendingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = Utils(context).getScreenSize;
    final Color color = Utils(context).getColor;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: (){},
        child: Material(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FancyShimmerImage(
                  boxFit: BoxFit.fill,
                  errorWidget: Image.asset('assets/images/empty_image.png'),
                  imageUrl: "https://techcrunch.com/wp-content/uploads/2023/07/ETH-zurich-pixar-smoke.jpg",
                  height: size.height*0.33,
                  width: double.infinity,
                  ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Title',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),
                  ),
                ),
              Row(
                children: [
                  IconButton(onPressed: () async {}, 
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