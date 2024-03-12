import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsView extends StatefulWidget {
  const NewsView({Key? key}) : super(key: key);

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  late WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: WebView(
        initialUrl:
            "https://www.123telugu.com/mnews/prasanth-varma-drops-an-update-on-hanu-mans-ott-release-date.html",
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
        },
      ),
    );
  }
}
