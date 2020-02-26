import 'package:aya_hospital/screens/home/controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;

class DetailsView extends StatefulWidget {
  final String title;
  final String pageId;
  DetailsView({this.title, this.pageId});
  @override
  _DetailsViewState createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  Response response;
  AyaController ayaController = AyaController();
  bool _loading = true;
  @override
  void initState() {
    _getData();
    super.initState();
  }

  _getData() async {
    response = await ayaController.getPage(pageId: widget.pageId);
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).accentColor,
            centerTitle: true,
            title: Text(
              widget.title,
              style: TextStyle(fontSize: 15),
            ),
          ),
          body: _loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  children: <Widget>[
                    response == null
                        ? Container()
                        : Padding(
                            padding: EdgeInsets.all(10),
                            child: Html(
                              data: response.data['content']['rendered'],
                              useRichText: true,
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
                )),
    );
  }
}
