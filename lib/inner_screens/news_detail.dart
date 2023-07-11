import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_flutter_course/services/utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewDetilScreen extends StatefulWidget {
  const NewDetilScreen({super.key});

  @override
  State<NewDetilScreen> createState() => _NewDetilScreenState();
}

class _NewDetilScreenState extends State<NewDetilScreen> {
  late WebViewController _webViewController;
  double _progress = 0.0;

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;

    return WillPopScope(
      onWillPop: () async {
        if (await _webViewController.canGoBack()) {
          _webViewController.goBack();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          centerTitle: true,
          iconTheme: IconThemeData(color: color),
          title: Text(
            'URL',
            style: TextStyle(color: color),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
          ],
        ),
        body: WebView(
          initialUrl:
              "https://techcrunch.com/2023/07/06/you-cant-post-ass-threads-is-doomed-meta-instagram-twitter/?cx_testId=6&cx_testVariant=cx_undefined&cx_artPos=2#cxrecs_s",
          zoomEnabled: true,
          onProgress: (progress) {
            setState(() {
              _progress = progress / 100;
            });
          },
          onWebViewCreated: (controller) {
            _webViewController = controller;
          },
        ),
      ),
    );
  }
}
