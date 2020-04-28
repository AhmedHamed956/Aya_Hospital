import 'package:aya_hospital/helpers/app_localizations.dart';
import 'package:aya_hospital/screens/contactus/view.dart';
import 'package:aya_hospital/screens/details/view.dart';
import 'package:aya_hospital/screens/webview/view.dart';
import 'package:aya_hospital/screens/your_opinion_matters/view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';

Widget drawerItem(
    {IconData iconData, String title, Function onTap, BuildContext context}) {
  return Column(
    children: <Widget>[
      Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.only(right: 25, top: 25),
          child: InkWell(
            onTap: onTap,
            child: Row(
              children: <Widget>[
                Icon(
                  iconData,
                  color: Colors.black,
                  size: 30,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  title,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
    ],
  );
}

Widget drawer({BuildContext context, bool loading, Response response}) {
  return Drawer(
    child: loading
        ? Container()
        : Container(
            color: Colors.white,
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 150,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          image: DecorationImage(
                            image: AssetImage('assets/logo.png'),
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                      itemCount: response.data['items'].length,
                      itemBuilder: (context, index) {
                        if (response.data['items'][index]['title'] ==
                                "من نحن" ||
                            response.data['items'][index]['title'] ==
                                "معرض الصور")
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                                if(response.data['items'][index]['title'] ==
                                    "معرض الصور"){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WebView(
                                            title: "معرض الصور",
                                            url:
                                            "https://www.ayahospital.com.sa/%d9%85%d8%b9%d8%b1%d8%b6-%d8%a7%d9%84%d8%b5%d9%88%d8%b1-%d9%85%d9%88%d8%a8%d9%8a%d9%84/")));
                                }else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DetailsView(
                                                title: response.data['items']
                                                [index]['title'],
                                                pageId: response.data['items']
                                                [index]['object_id'],
                                              )));
                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    response.data['items'][index]['title'],
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  )
                                ],
                              ),
                            ),
                          );
                        else
                          return Container();
                      }),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => YourOpinionMattersView()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context).translate('call_us'),
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
  );
}
