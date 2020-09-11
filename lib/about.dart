import 'package:demo_app_dsc/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  void launchUrl() async {
    const url = 'https://dscsastra.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.blueAccent[200],
        ),
        drawer: CDrawer(),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(sw * 0.05),
            child: Column(
              children: <Widget>[
                Container(
                    width: sw * 0.8, child: Image.asset('lib/assets/Logo.png')),
                Container(
                  width: sw * 0.8,
                  child: Text(
                      'Developer Student Clubs is a community where everyone is welcome. We help students bridge the gap between theory and practice and grow their knowledge by providing a peer-to-peer learning environment, by conducting workshops, study jams and building solutions for local businesses. Developer Student Clubs is a program supported by Google Developers.',
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'Work Sans')),
                ),
                SizedBox(
                  height: 20,
                ),
                OutlineButton(
                  child: Text(
                    'Visit dscsastra.com',
                    style: TextStyle(
                        fontFamily: 'Work Sans', color: Colors.blue[300]),
                  ),
                  borderSide: BorderSide(
                    color: Colors.blue[300],
                  ),
                  shape: StadiumBorder(),
                  onPressed: launchUrl,
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
