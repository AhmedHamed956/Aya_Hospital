import 'package:aya_hospital/helpers/app_localizations.dart';
import 'package:aya_hospital/lang/lang.dart';
import 'package:aya_hospital/screens/details/view.dart';
import 'package:aya_hospital/screens/doctors/view.dart';
import 'package:aya_hospital/screens/drawer/view.dart';
import 'package:aya_hospital/screens/home/controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Response response;
  AyaController ayaController = AyaController();
  bool _loading = true;
  List<String> titles = [];
  List<String> details = [];
  List<String> _sliderImages = [
    "assets/1.jpg",
    "assets/2.jpg",
    "assets/3.jpg",
    "assets/4.jpg",
    "assets/5.jpg",
    "assets/6.jpg",
    "assets/7.jpg"
  ];

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

  Widget _card({String title, Function onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(140),
            color: Theme.of(context).accentColor),
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          drawer: _loading
              ? Container()
              : drawer(context: context, loading: _loading, response: response),
          appBar: AppBar(
            backgroundColor: Theme.of(context).accentColor,
            centerTitle: true,
            actions: <Widget>[
              Consumer<AppConfig>(
                builder: (context, appconfig, child) {
                  return IconButton(
                      icon: Icon(
                        Icons.flare,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        appconfig.isDark = !appconfig.isDark;
                      });
                },
              )
            ],
            title: Text(
              AppLocalizations.of(context).translate('title'),
              style: TextStyle(fontSize: 14),
            ),
          ),
          body: _loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Scrollbar(
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8, right: 8, bottom: 10),
                        child: ConstrainedBox(
                            child: Swiper(
                              autoplayDelay: 6000,
                              autoplay: true,
                              itemBuilder: (c, index) {
                                return Wrap(
                                  runSpacing: 6.0,
                                  children: _sliderImages.map((item) {
                                    return Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context).accentColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Image.asset(
                                        _sliderImages[index],
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  }).toList(),
                                );
                              },
                              pagination: SwiperPagination(
                                  margin: EdgeInsets.all(5.0),
                                  builder: DotSwiperPaginationBuilder(
                                      activeColor: Colors.transparent,
                                      activeSize: 0.0,
                                      size: 0.0,
                                      color: Colors.transparent)),
                              itemCount: _sliderImages.length,
                            ),
                            constraints: BoxConstraints.loose(
                              Size(MediaQuery.of(context).size.width, 170.0),
                            )),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: Text(
                            'عندما يتعلق الامر بإتخاذ قرار بأنشاء مستشفى طبى ليس بالأمر السهل . وبالأخص عند التفكير  في أنشاء مستشفى متخصص في مجال النساء والتوليد والعقم وجراحات المناظير والإخصاب والأطفال.  وفقآ لآنظمة الصحة العالمية  .'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            _card(
                                title: 'اطباء أيه',
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DoctorsView()));
                                }),
                            _card(
                                title: 'قائمه المنشورات',
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailsView(
                                                pageId: '6817',
                                                title: 'قائمه المنشورات',
                                              )));
                                })
                          ],
                        ),
                      )
                    ],
                  ),
                )),
    );
  }
}
