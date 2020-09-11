import 'dart:convert';
import 'dart:ui';
import 'widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hexcolor/hexcolor.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map data;
  List finalData;
  final themeColor = Colors.blueAccent[200];
  fetchData() async {
    var link = 'https://wayhike.com/dsc/demo_app_api.php';
    http.Response response = await http.get(link);
    setState(() {
      data = jsonDecode(response.body);
      finalData = data['event_titles'].toList();
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: themeColor,
        ),
        backgroundColor: Colors.white,
        drawer: CDrawer(),
        body: finalData != null
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: finalData.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Material(
                      shape: StadiumBorder(),
                      elevation: 10,
                      child: Container(
                          height: 70,
                          child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                            finalData[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Work Sans',
                                  fontSize: sw * 0.042,
                                  fontWeight: FontWeight.bold),
                          ),
                              ))),
                    ),
                  );
                },
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
