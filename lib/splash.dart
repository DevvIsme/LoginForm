import 'dart:async';
import 'package:flutter/material.dart';
import 'package:newapp/controller.dart';
import 'package:newapp/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:newapp/constrants.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late String tt;

  Future<void> loaddata(BuildContext context) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    tt = (await pref.getString('datatoken'))!;
    if (tt == "") {
      Timer(
          Duration(seconds: 2),
          () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MyHomePage())));
    } else {
      control ctl = control();
      ctl.info(tt, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    loaddata(context);
    return Container(
        color: constyle.mautrang,
        child: FlutterLogo(size: MediaQuery.of(context).size.height));
  }
}
