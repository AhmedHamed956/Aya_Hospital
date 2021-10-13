import 'package:flutter/material.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebView extends StatefulWidget {
  final String url;
  final String title;

  WebView({this.url, this.title});

  @override
  State<StatefulWidget> createState() {
    return WebViewState();
  }
}

class WebViewState extends State<WebView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 15),
        ),
      ),
      withJavascript: true,
      appCacheEnabled: true,
      url: widget.url,
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
    );
  }
}
