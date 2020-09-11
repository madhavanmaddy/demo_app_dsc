import 'package:flutter/material.dart';
import 'package:demo_app_dsc/main.dart';
import 'package:demo_app_dsc/about.dart';

class CDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.of(context).size.width;
    return Drawer(
      child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blueAccent[200]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text("Demo app DSC",style: TextStyle(color:Colors.white,fontSize:sw*0.07,fontFamily: 'Work Sans'),),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                title: Text('Home',style: TextStyle(fontFamily:'Work Sans'),),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => MyHomePage()));
                },
              ),
              ListTile(
                leading: Icon(Icons.info, color: Colors.black),
                title: Text('About',style: TextStyle(fontFamily:'Work Sans'),),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => About()));
                },
              ),
            ],
      )
    );
  }
}