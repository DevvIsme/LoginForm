import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:newapp/information.dart';
import 'package:newapp/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}
class _SplashPageState extends State<SplashPage> {


  late String tt;

  
  Future<void> loaddata() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    tt = (await pref.getString('datatoken'))!;
              print('TT: $tt');
        if (tt == "")
        {
          Timer(Duration(seconds: 3),
    
          ()=>Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder:
                                                          (context) => 
                                                          
                                                          MyHomePage()
                                                         )
                                       )
         );
        }
         else
    {
       try {
      Response res = await post(
          Uri.parse(
              'http://lms-school-node1.vnpt.edu.vn/service/user/getUserProfile'),
          headers: <String, String>{'authorization': tt},
          body: {});

      if (res.statusCode == 200) {
        dulieu = jsonDecode(res.body.toString());
         Timer(Duration(seconds: 3),
    
          ()=>Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder:
                                                          (context) => 
                                                          
                                                          InfoPage()
                                                         )
                                       )
         );
    //    Navigator.push(context,
        //    MaterialPageRoute(builder: (context) => InfoPage(tk: dulieu)));
      } else
        print('Extract Info: Failed');
    } catch (e) {
      print('From Gen INF: ' + e.toString());
    }
     
    }
   
  }


/*
  @override
  void initState() {
    super.initState();
        loaddata();
            print('TT: $tt');

        Timer(Duration(seconds: 3),
    
          ()=>Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder:
                                                          (context) => 
                                                          
                                                          MyHomePage()
                                                         )
                                       )
         );
   /* else
    {
      Timer(Duration(seconds: 3),
    
          ()=>Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder:
                                                          (context) => 
                                                          
                                                          InfoPage(tk: tt)
                                                         )
                                       )
         );
    }
  */
  }

  */
  

  @override
  Widget build(BuildContext context) {
    loaddata();
    //print('TT form outside: $tt');
    return Container(
      color: Colors.white,
      child:FlutterLogo(size:MediaQuery.of(context).size.height)
    );
    // ignore: dead_code
  }
}