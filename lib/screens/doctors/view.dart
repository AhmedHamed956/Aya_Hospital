import 'package:aya_hospital/screens/doctor/view.dart';
import 'package:aya_hospital/screens/home/controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DoctorsView extends StatefulWidget {
  @override
  _DoctorsViewState createState() => _DoctorsViewState();
}

class _DoctorsViewState extends State<DoctorsView> {
  Response response;
  AyaController ayaController = AyaController();
  bool _loading = true;
  @override
  void initState() {
    _getData();
    super.initState();
  }

  _getData() async {
    response = await ayaController.getDoctors();
    setState(() {
      _loading = false;
    });
  }

  Widget _doctor(
      {String doctorName, String doctorImage, String details, String ren}) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DoctrorView(
                      doctorName: doctorName,
                      rend: ren,
                    )));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        width: MediaQuery.of(context).size.width,
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.white10),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                doctorImage,
                width: 100,
                height: 100,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(doctorName),
              ],
            ))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).accentColor,
          title: Text(
            'اطباء أيه',
            style: TextStyle(fontSize: 15),
          ),
        ),
        body: _loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: response.data.length,
                itemBuilder: (context, index) {
                  return _doctor(
                      ren: response.data[index]['content']['rendered'],
                      doctorImage: response.data[index]['better_featured_image']
                          ['source_url'],
                      details: response.data[index]['excerpt']['rendered'],
                      doctorName: response.data[index]['title']['rendered']);
                }),
      ),
    );
  }
}
