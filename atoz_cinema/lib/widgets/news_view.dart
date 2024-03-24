import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class NewsView extends StatelessWidget {
  final String? url;
  NewsView({super.key, this.url});

  // ignore: unused_field
  late WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    String defaultUrl =
        "https://www.123telugu.com/mnews/prasanth-varma-drops-an-update-on-hanu-mans-ott-release-date.html";

    return Container(
      child: WebView(
        initialUrl: url ?? defaultUrl,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
        },
      ),
    );
  }
}
