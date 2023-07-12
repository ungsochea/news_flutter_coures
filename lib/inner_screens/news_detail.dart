import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_flutter_course/services/global_methods.dart';
import 'package:news_flutter_course/services/utils.dart';
import 'package:news_flutter_course/widgets/vertical_spacing.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewDetilScreen extends StatefulWidget {
  const NewDetilScreen({super.key});

  @override
  State<NewDetilScreen> createState() => _NewDetilScreenState();
}

class _NewDetilScreenState extends State<NewDetilScreen> {
  late WebViewController _webViewController;
  double _progress = 0.0;
  final url =
      "https://techcrunch.com/2023/07/06/you-cant-post-ass-threads-is-doomed-meta-instagram-twitter/?cx_testId=6&cx_testVariant=cx_undefined&cx_artPos=2#cxrecs_s";

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
            IconButton(
                onPressed: () async {
                  await _showModelSheetFct();
                },
                icon: const Icon(Icons.more_horiz))
          ],
          leading: IconButton(
            icon: const Icon(IconlyLight.arrowLeft2),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: WebView(
          initialUrl: url,
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

  Future<void> _showModelSheetFct() async {
    await showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20))),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              const VerticalSpacing(20),
              Center(
                child: Container(
                  height: 5,
                  width: 35,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
              const VerticalSpacing(20),
              const Text(
                "More Option",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              const VerticalSpacing(20),
              const Divider(
                thickness: 2,
              ),
              const VerticalSpacing(20),
              ListTile(
                leading: const Icon(Icons.share),
                title: const Text("Share"),
                onTap: () async {
                  try {
                    await Share.share(
                        'check out my website https://example.com',
                        subject: 'Look what I made!');
                  } catch (err) {
                    GlobalMethods().errorDialog(
                        errorMessage: err.toString(), context: context);
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.open_in_browser),
                title: const Text("Open in browser"),
                onTap: () async {
                  if (!await launchUrl(Uri.parse(url))) {
                    throw Exception('Could not launch $url');
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.refresh),
                title: const Text("Refresh"),
                onTap: () async {
                  try {
                    _webViewController.reload();
                  } catch (err) {
                    log("error $err");
                  } finally {
                    Navigator.of(context).pop();
                  }
                },
              ),
            ]),
          );
        });
  }

  Future<void> errorDialog({required String errorMessage}) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(errorMessage),
            title: const Row(children: [
              Icon(
                IconlyBold.danger,
                color: Colors.red,
              ),
              SizedBox(
                width: 8,
              ),
              Text("An error occured")
            ]),
            actions: [
              TextButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                child: const Text("ok"),
              )
            ],
          );
        });
  }
}
