import 'package:aya_hospital/helpers/app_localizations.dart';
import 'package:aya_hospital/screens/contactus/view.dart';
import 'package:aya_hospital/screens/details/view.dart';
import 'package:aya_hospital/screens/drawer/view.dart';
import 'package:aya_hospital/screens/webview/view.dart';
import 'package:aya_hospital/screens/your_opinion_matters/view.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
      backgroundColor: Colors.white,
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
              CarouselSlider(
                  items: [
                    "ayahospital_home_bannar.jpeg",
                    "IMG_0035.JPG",
                    "IMG_0036.JPG",
                    "IMG_0037.JPG"
                  ].map((image) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset("assets/$image", fit: BoxFit.fill,));
                  }).toList(),
                  options: CarouselOptions(
                    height: 190,
                    viewportFraction: 1,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 5),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  )),
              Align(
                alignment: AlignmentDirectional.center,
                child: Container(
                  margin: EdgeInsets.only(top: 150),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(
                        color: Color(0xFFe1e0ce),
                      )),
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
                              builder: (context) => WebView(
                                  title: AppLocalizations.of(context)
                                      .translate('quick_reservation'),
                                  url:
                                      "https://reports.ayahospital.com.sa/reserv")));
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
                              builder: (context) => WebView(
                                  title: AppLocalizations.of(context)
                                      .translate('medical_file'),
                                  url: "https://reports.ayahospital.com.sa")));
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WebView(
                                    title: AppLocalizations.of(context)
                                        .translate('home_care'),
                                    url:
                                        "https://reports.ayahospital.com.sa/SER_OUTPAT/out_pat_main")));
                      },
                      child: Container(
                          width: (MediaQuery.of(context).size.width * 2) / 5,
                          height: 150,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                color: Color(0xFFe1e0ce),
                              )),
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                "assets/home-care.png",
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
                                builder: (context) => WebView(
                                    title: AppLocalizations.of(context)
                                        .translate('aya_doctors'),
                                    url:
                                        "https://www.ayahospital.com.sa/%d8%a7%d8%b7%d8%a8%d8%a7%d8%a1-%d8%a2%d9%8a%d8%a9-%d9%85%d9%88%d8%a8%d9%8a%d9%84/")));
//                        Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                                builder: (context) => DetailsView(
//                                      title: AppLocalizations.of(context)
//                                          .translate('aya_doctors'),
//                                      pageId: "6135",
//                                    )));
                      },
                      child: Container(
                          width: (MediaQuery.of(context).size.width * 2) / 5,
                          height: 150,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                color: Color(0xFFe1e0ce),
                              )),
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
                                builder: (context) => WebView(
                                    title: AppLocalizations.of(context)
                                        .translate('cure_sections'),
                                    url:
                                        "https://www.ayahospital.com.sa/%d8%a7%d9%84%d8%a7%d9%82%d8%b3%d8%a7%d9%85-%d8%a7%d9%84%d8%b9%d9%84%d8%a7%d8%ac%d9%8a%d8%a9-%d9%85%d9%88%d8%a8%d9%8a%d9%84/")));
//                        Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                                builder: (context) => DetailsView(
//                                      title: AppLocalizations.of(context)
//                                          .translate('cure_sections'),
//                                      pageId: "6231",
//                                    )));
                      },
                      child: Container(
                          width: (MediaQuery.of(context).size.width * 2) / 5,
                          height: 150,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                color: Color(0xFFe1e0ce),
                              )),
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
                                builder: (context) => WebView(
                                    title: AppLocalizations.of(context)
                                        .translate('health_education'),
                                    url:
                                        "https://www.ayahospital.com.sa/%d8%aa%d8%ab%d9%82%d9%81-%d9%85%d8%b9%d8%a7%d9%86%d8%a7-%d9%85%d9%88%d8%a8%d9%8a%d9%84/")));
//                        Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                                builder: (context) => DetailsView(
//                                      title: AppLocalizations.of(context)
//                                          .translate('health_education'),
//                                      pageId: "6143",
//                                    )));
                      },
                      child: Container(
                          width: (MediaQuery.of(context).size.width * 2) / 5,
                          height: 150,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                color: Color(0xFFe1e0ce),
                              )),
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                "assets/taskyef.png",
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
                                  BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                color: Color(0xFFe1e0ce),
                              )),
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
                                  BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                color: Color(0xFFe1e0ce),
                              )),
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                "assets/write.png",
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
                    ),
                    InkWell(
                      onTap: () {
//                        Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                                builder: (context) => DetailsView(
//                                      title: AppLocalizations.of(context)
//                                          .translate('call_us'),
//                                      pageId: "6426",
//                                    )));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    YourOpinionMattersView()));
                      },
                      child: Container(
                          width: (MediaQuery.of(context).size.width * 2) / 7,
                          height: 150,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                color: Color(0xFFe1e0ce),
                              )),
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                "assets/home_contact_icon2.png",
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
