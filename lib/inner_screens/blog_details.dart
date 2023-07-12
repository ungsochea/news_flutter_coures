import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_flutter_course/services/utils.dart';
import 'package:news_flutter_course/widgets/vertical_spacing.dart';

class BlogDetailScreen extends StatefulWidget {
  const BlogDetailScreen({super.key});
  static const routeName = '/BlogDetailScreen';

  @override
  State<BlogDetailScreen> createState() => _BlogDetailScreenState();
}

class _BlogDetailScreenState extends State<BlogDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
    return Scaffold(
      appBar: AppBar(
        // iconTheme: IconThemeData(color: color),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          "By Sochea",
          textAlign: TextAlign.center,
          style: TextStyle(color: color),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(IconlyLight.arrowLeft),
          color: color,
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Title " * 10,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w700),
                ),
                const VerticalSpacing(25),
                const Row(
                  children: [
                    Text("12/07/2023"),
                    Spacer(),
                    Text("readingTimeText"),
                  ],
                ),
                const VerticalSpacing(20),
              ],
            ),
          ),
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: FancyShimmerImage(
                      boxFit: BoxFit.fill,
                      errorWidget: Image.asset('assets/images/empty_image.png'),
                      imageUrl:
                          "https://i.guim.co.uk/img/media/cd6efbd1bade44704b0b4f1d7a2b72e3a635a823/0_247_5568_3341/master/5568.jpg?width=1200&height=900&quality=85&auto=format&fit=crop&s=1dc4191028d3f1147475a2ea0acc8d6a"),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 5,
                child: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Card(
                          elevation: 10,
                          shape: const CircleBorder(),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              IconlyLight.send,
                              size: 28,
                              color: color,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Card(
                          elevation: 10,
                          shape: const CircleBorder(),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              IconlyLight.bookmark,
                              size: 28,
                              color: color,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextContext(
                  lable: "Description",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                VerticalSpacing(10),
                TextContext(
                  lable:
                      "Description Description Description Description Description Description Description Description",
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
                VerticalSpacing(20),
                TextContext(
                  lable: "Content",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                VerticalSpacing(10),
                TextContext(
                  lable:
                      "Content Content Content Content Content Content Content Content",
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TextContext extends StatelessWidget {
  const TextContext(
      {super.key,
      required this.lable,
      required this.fontSize,
      required this.fontWeight});
  final String lable;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      lable,
      textAlign: TextAlign.justify,
      style: GoogleFonts.roboto(fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}
