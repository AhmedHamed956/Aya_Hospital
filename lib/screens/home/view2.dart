import 'package:aya_hospital/helpers/app_localizations.dart';
import 'package:aya_hospital/screens/contactus/view.dart';
import 'package:aya_hospital/screens/details/view.dart';
import 'package:aya_hospital/screens/drawer/view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'controller.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Response response;
  AyaController ayaController = AyaController();
  bool _loading = true;

  @override
  void initState() {
    _getData();
    super.initState();
  }

  _getData() async {
    response = await ayaController.getData();
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe1e0ce),
      drawer: _loading
          ? Container()
          : drawer(context: context, loading: _loading, response: response),
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/home_banner.png",
                  height: 170,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: AlignmentDirectional.center,
                child: Container(
                  margin: EdgeInsets.only(top: 130),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Image.asset(
                    "assets/appIcon.png",
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: <Widget>[
//              Text(
//                AppLocalizations.of(context).translate('welcome'),
//              ),
//              Text(
//                AppLocalizations.of(context).translate('hospital_name'),
//              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    color: Theme.of(context).accentColor,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsView(
                                    title: AppLocalizations.of(context)
                                        .translate('quick_reservation'),
                                    pageId: "6248",
                                  )));
                    },
                    child: Text(
                      AppLocalizations.of(context)
                          .translate('quick_reservation'),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    color: Theme.of(context).accentColor,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsView(
                                    title: AppLocalizations.of(context)
                                        .translate('medical_file'),
                                    pageId: "7109",
                                  )));
                    },
                    child: Text(
                      AppLocalizations.of(context).translate('medical_file'),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
//              Container(
//                width: (MediaQuery.of(context).size.width * 2) / 3,
//                margin: EdgeInsets.only(top: 10),
//                child: FlatButton(
//                  shape: RoundedRectangleBorder(
//                    borderRadius: BorderRadius.circular(30.0),
//                  ),
//                  color: Theme.of(context).accentColor,
//                  onPressed: () {
//                    Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                            builder: (context) => DetailsView(
//                                  title: AppLocalizations.of(context)
//                                      .translate('quick_reservation'),
//                                  pageId: "6248",
//                                )));
//                  },
//                  child: Text(
//                    AppLocalizations.of(context).translate('quick_reservation'),
//                    style: TextStyle(color: Colors.white),
//                  ),
//                ),
//              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
//                        Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                                builder: (context) => ContactUsView()));
                      },
                      child: Container(
                          width: (MediaQuery.of(context).size.width * 2) / 5,
                          height: 150,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                "assets/home_contact_icon.png",
                                height: 60,
                                width: 60,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                AppLocalizations.of(context)
                                    .translate('home_care'),
                                style: TextStyle(
                                    color: Theme.of(context).accentColor),
                              ),
                              Text(
                                AppLocalizations.of(context)
                                    .translate('home_care_subtitle'),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 10),
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsView(
                                      title: AppLocalizations.of(context)
                                          .translate('aya_doctors'),
                                      pageId: "6135",
                                    )));
                      },
                      child: Container(
                          width: (MediaQuery.of(context).size.width * 2) / 5,
                          height: 150,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                "assets/home_doctors_icon.png",
                                height: 60,
                                width: 60,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                AppLocalizations.of(context)
                                    .translate('aya_doctors'),
                                style: TextStyle(
                                    color: Theme.of(context).accentColor),
                              ),
                              Text(
                                AppLocalizations.of(context)
                                    .translate('aya_doctors_subtitle'),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 10),
                              ),
                            ],
                          )),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsView(
                                      title: AppLocalizations.of(context)
                                          .translate('cure_sections'),
                                      pageId: "6231",
                                    )));
                      },
                      child: Container(
                          width: (MediaQuery.of(context).size.width * 2) / 5,
                          height: 150,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                "assets/home_services_icon.png",
                                height: 60,
                                width: 60,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                AppLocalizations.of(context)
                                    .translate('cure_sections'),
                                style: TextStyle(
                                    color: Theme.of(context).accentColor),
                              ),
                              Text(
                                AppLocalizations.of(context)
                                    .translate('cure_sections_subtitle'),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 10),
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsView(
                                      title: AppLocalizations.of(context)
                                          .translate('health_education'),
                                      pageId: "6143",
                                    )));
                      },
                      child: Container(
                          width: (MediaQuery.of(context).size.width * 2) / 5,
                          height: 150,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                "assets/home_medical_blog_icon.png",
                                height: 60,
                                width: 60,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                AppLocalizations.of(context)
                                    .translate('health_education'),
                                style: TextStyle(
                                    color: Theme.of(context).accentColor),
                              ),
                              Text(
                                AppLocalizations.of(context)
                                    .translate('health_education_subtitle'),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 10),
                              ),
                            ],
                          )),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        _launchURL(
                            url: "https://goo.gl/maps/CRid4t7vXPwcRboSA");
                      },
                      child: Container(
                          width: (MediaQuery.of(context).size.width * 2) / 7,
                          height: 150,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                "assets/home_location_icon.png",
                                height: 60,
                                width: 60,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                AppLocalizations.of(context)
                                    .translate('location_on_map'),
                                style: TextStyle(
                                    color: Theme.of(context).accentColor),
                              ),
                              Text(
                                AppLocalizations.of(context)
                                    .translate('location_on_map_subtitle'),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 10),
                              ),
                            ],
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ContactUsView()));
                      },
                      child: Container(
                          width: (MediaQuery.of(context).size.width * 2) / 7,
                          height: 150,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                "assets/home_medical_blog_icon.png",
                                height: 60,
                                width: 60,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                AppLocalizations.of(context)
                                    .translate('call_us'),
                                style: TextStyle(
                                    color: Theme.of(context).accentColor),
                              ),
                              Text(
                                AppLocalizations.of(context)
                                    .translate('call_us_subtitle'),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 10),
                              ),
                            ],
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsView(
                                      title: AppLocalizations.of(context)
                                          .translate('your_opinion_matters'),
                                      pageId: "6426",
                                    )));
                      },
                      child: Container(
                          width: (MediaQuery.of(context).size.width * 2) / 7,
                          height: 150,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                "assets/home_medical_blog_icon.png",
                                height: 60,
                                width: 60,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                AppLocalizations.of(context)
                                    .translate('your_opinion_matters'),
                                style: TextStyle(
                                    color: Theme.of(context).accentColor),
                              ),
                              Text(
                                AppLocalizations.of(context)
                                    .translate('your_opinion_matters_subtitle'),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 10),
                              ),
                            ],
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }

  _launchURL({String url}) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
