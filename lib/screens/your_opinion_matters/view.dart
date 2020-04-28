import 'package:aya_hospital/helpers/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mailer2/mailer.dart';

class YourOpinionMattersView extends StatefulWidget {
  @override
  _YourOpinionMattersViewState createState() => _YourOpinionMattersViewState();
}

class _YourOpinionMattersViewState extends State<YourOpinionMattersView> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  _launchURL({String url}) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).accentColor,
        title: Text(
          AppLocalizations.of(context).translate('call_us'),
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "بيانات اتصال",
                    style: TextStyle(
                        color: Theme.of(context).accentColor, fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          Icons.location_on,
                          color: Theme.of(context).accentColor,
                          size: 16,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border: Border.all(
                                color: Theme.of(context).accentColor,
                                width: 1.5)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "موقعنا",
                              style:
                                  TextStyle(color: Theme.of(context).accentColor),
                            ),
                            Text(
                              "جده حي المحمدية شارع الأمير سلطان مقابل آية مول وساكو",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          Icons.call,
                          color: Theme.of(context).accentColor,
                          size: 16,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border: Border.all(
                                color: Theme.of(context).accentColor,
                                width: 1.5)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "الرقم الموحد: ",
                              style:
                                  TextStyle(color: Theme.of(context).accentColor),
                            ),
                            Text(
                              "920012342",
                              style:
                                  TextStyle(color: Theme.of(context).accentColor),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          FontAwesomeIcons.fax,
                          color: Theme.of(context).accentColor,
                          size: 16,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border: Border.all(
                                color: Theme.of(context).accentColor,
                                width: 1.5)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "رقم الفاكس: ",
                              style:
                                  TextStyle(color: Theme.of(context).accentColor),
                            ),
                            Text(
                              "966126997457",
                              style:
                                  TextStyle(color: Theme.of(context).accentColor),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          Icons.email,
                          color: Theme.of(context).accentColor,
                          size: 16,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border: Border.all(
                                color: Theme.of(context).accentColor,
                                width: 1.5)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "info@example.com",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "معلومات الاتصال",
                    style: TextStyle(
                        color: Theme.of(context).accentColor, fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "⚫",
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                "للاستفسارات الموارد البشرية (وارسال السيرة الذاتية) استعمال البريد الالكترونى الاتى : ",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: Theme.of(context)
                                    .textTheme
                                    .title
                                    .fontFamily),
                          ),
                          TextSpan(
                            text: "hr@ayahospital.com.sa",
                            style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context).accentColor,
                                fontFamily: Theme.of(context)
                                    .textTheme
                                    .title
                                    .fontFamily),
                          )
                        ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "⚫",
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                "للاتصال بالمدير العام , فمن فضلك استخدم البريد الالكترونى الاتى : ",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: Theme.of(context)
                                    .textTheme
                                    .title
                                    .fontFamily),
                          ),
                          TextSpan(
                            text: "gm@ayahospital.com.sa",
                            style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context).accentColor,
                                fontFamily: Theme.of(context)
                                    .textTheme
                                    .title
                                    .fontFamily),
                          )
                        ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "⚫",
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                "للشكاوى وتقديم المقترحات, فمن فضلك استخدم البريد الالكترونى الاتى : ",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: Theme.of(context)
                                    .textTheme
                                    .title
                                    .fontFamily),
                          ),
                          TextSpan(
                            text: "complaint@ayahospital.com.sa",
                            style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context).accentColor,
                                fontFamily: Theme.of(context)
                                    .textTheme
                                    .title
                                    .fontFamily),
                          )
                        ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "⚫",
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                "الرقم المباشر للحجوزات والاستفسارات : ",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: Theme.of(context)
                                    .textTheme
                                    .title
                                    .fontFamily),
                          ),
                          TextSpan(
                            text: "920012342",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: Theme.of(context)
                                    .textTheme
                                    .title
                                    .fontFamily),
                          )
                        ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "⚫",
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                "الرقم الخاص بالتحويلات ",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: Theme.of(context)
                                    .textTheme
                                    .title
                                    .fontFamily),
                          ),
                          TextSpan(
                            text: "0126944499",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: Theme.of(context)
                                    .textTheme
                                    .title
                                    .fontFamily),
                          )
                        ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "⚫",
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                "خدمة العملاء ",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: Theme.of(context)
                                    .textTheme
                                    .title
                                    .fontFamily),
                          ),
                          TextSpan(
                            text: "(1063-1064)",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: Theme.of(context)
                                    .textTheme
                                    .title
                                    .fontFamily),
                          )
                        ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "الطوارىء",
                    style: TextStyle(
                        color: Theme.of(context).accentColor, fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text:
                            "فى حالات الطوارىء يمكنك الاتصال بالرقم: ",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: Theme.of(context)
                                    .textTheme
                                    .title
                                    .fontFamily),
                          ),
                          TextSpan(
                            text: "6944499 12 966 +",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: Theme.of(context)
                                    .textTheme
                                    .title
                                    .fontFamily),
                          ),
                          TextSpan(
                            text:
                            "رقم التوصيلة الداخلية: ",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: Theme.of(context)
                                    .textTheme
                                    .title
                                    .fontFamily),
                          ),
                          TextSpan(
                            text: "1017- 1016.",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: Theme.of(context)
                                    .textTheme
                                    .title
                                    .fontFamily),
                          )
                        ],
                      ),
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
