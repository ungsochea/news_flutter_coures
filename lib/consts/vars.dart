import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

enum NewsType { topTrading, allNews }

enum SortByEnum { relevancy, popularity, publishedAt }

TextStyle smallTextStyle = GoogleFonts.montserrat(fontSize: 15);

const List<String> searchKeyWords = [
  "Football",
  "Flutter",
  "Python",
  "Weather",
  "Crypto",
  "Bitcoin",
  "Youtube",
  "Meta",
  "Netflix",
];
