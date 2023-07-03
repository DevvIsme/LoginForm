// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:newapp/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InfoPage extends StatefulWidget {
  InfoPage({super.key});



  @override
  State<InfoPage> createState() => _InfoPageState();
}
class _InfoPageState extends State<InfoPage> {
    //var infor;

/*
var dulieu;
   void info() async {
    try {
      Response res = await post(
          Uri.parse(
              'http://lms-school-node1.vnpt.edu.vn/service/user/getUserProfile'),
          headers: <String, String>{'authorization': widget.tk},
          body: {});

      if (res.statusCode == 200) {
                  dulieu = jsonDecode(res.body.toString());
       /* print(dulieu['data']['user_profile']['full_name']);
        print(widget.tk);
                      name = dulieu['data']['user_profile']['full_name'];
        dob = dulieu['data']['user_profile']['birthday'];
      /*  name = dulieu['data']['user_profile']['full_name'];
        dob = dulieu['data']['user_profile']['birthday'];*/

        email = dulieu['data']['user_profile']['email'];
        */
      } else
        print('Failed');
    } catch (e) {
      print('From Gen INF: ' + e.toString());
    }
  }*/

 /* @override
  void initState() {
    super.initState();
    setState(() {
      info();
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text('Thong tin'),
            automaticallyImplyLeading: false,
          ),
          body: ListView(
            children: [
              Center(
                  child: Text(
                'Thong tin ca nhan',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              )),
              Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  height: 200,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                            infoitem(
                          info: dulieu['data']['user_profile']['full_name'],
                          title: 'Name: ', 
                       //   infor: infor,
                        ),
                        infoitem(
                          info: dulieu['data']['user_profile']['birthday'],
                          title: 'Birthday: ',
                                                   // infor: infor,
                        ),
                        infoitem(
                          info: dulieu['data']['user_profile']['email'],
                          title: 'Email: ',
                                               //    infor: infor,
                        ), 
                        ElevatedButton(
                          onPressed: () async {
                           SharedPreferences pref = await SharedPreferences.getInstance();
                            await pref.setString('datatoken', "");
                            Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
                        }, child: Text('Logout')),
                      ]),
                ),
              ),
            ],
          ));
    
  }
}

class infoitem extends StatelessWidget {
  infoitem({
    super.key,
    required this.title,
    required this.info,
    //required this.infor,
  });

   var textStyle = TextStyle(
    fontSize: 20,
  );


  final String info, title;
 
   // var infor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: textStyle,
        ),
        Text(
          info,
          style: textStyle,
        ),
      ],
    );
  }
}
