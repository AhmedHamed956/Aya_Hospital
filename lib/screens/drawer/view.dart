import 'package:aya_hospital/screens/contactus/view.dart';
import 'package:aya_hospital/screens/details/view.dart';
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
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ContactUsView()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'تواصل معنا',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                      itemCount: response.data['items'].length,
                      itemBuilder: (context, index) {
                        return ConfigurableExpansionTile(
                          headerExpanded: Flexible(
                              child: Center(
                                  child: Text(
                            response.data['items'][index]['title'],
                            style: TextStyle(color: Colors.red, fontSize: 16),
                          ))),
                          header: Container(
                              child: Center(
                                  child: Text(
                            response.data['items'][index]['title'],
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ))),
                          children: [
                            SizedBox(
                              height: 150,
                              child: ListView.builder(
                                  itemCount: response.data['items'][index]
                                              ['child_items'] ==
                                          null
                                      ? 0
                                      : response
                                          .data['items'][index]['child_items']
                                          .length,
                                  itemBuilder: (context, index2) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailsView(
                                                        title: response.data[
                                                                        'items']
                                                                    [index]
                                                                ['child_items']
                                                            [index2]['title'],
                                                        pageId: response.data[
                                                                        'items']
                                                                    [index]
                                                                ['child_items'][
                                                            index2]['object_id'],
                                                      )));
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              response.data['items'][index]
                                                      ['child_items'][index2]
                                                  ['title'],
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            )
                          ],
                        );
                      }),
                )
              ],
            ),
          ),
  );
}
