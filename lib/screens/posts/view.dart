import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;

class PostsView extends StatefulWidget {
  final String rend;
  PostsView({this.rend});
  @override
  _PostsViewState createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).accentColor,
          centerTitle: true,
          title: Text('قائمه المنشورات'),
        ),
        body: ListView(
          children: <Widget>[
            Html(
              data: widget.rend,
              customTextAlign: (dom.Node node) {
                if (node is dom.Element) {
                  switch (node.localName) {
                    case "p":
                      return TextAlign.justify;
                  }
                }
                return null;
              },
            )
          ],
        ),
      ),
    );
  }
}
