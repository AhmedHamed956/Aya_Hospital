import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;

class DoctrorView extends StatefulWidget {
  final String doctorName;
  final String rend;
  DoctrorView({this.doctorName, this.rend});
  @override
  _DoctrorViewState createState() => _DoctrorViewState();
}

class _DoctrorViewState extends State<DoctrorView> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).accentColor,
          centerTitle: true,
          title: Text(
            widget.doctorName,
            style: TextStyle(fontSize: 15),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Html(
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
