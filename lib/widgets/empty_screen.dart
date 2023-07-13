import 'package:flutter/material.dart';
import 'package:news_flutter_course/services/utils.dart';

class EmptyNewsWidget extends StatelessWidget {
  const EmptyNewsWidget(
      {super.key, required this.text, required this.imagePath});

  final String text, imagePath;

  @override
  Widget build(BuildContext context) {
    Color color = Utils(context).getColor;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Image.asset(imagePath),
            ),
            Flexible(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: color, fontSize: 30, fontWeight: FontWeight.w700),
              ),
            )
          ]),
    );
  }
}
