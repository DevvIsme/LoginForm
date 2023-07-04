import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newapp/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:newapp/constrants.dart';

import 'appbar.dart';

class InfoPage extends StatefulWidget {
  InfoPage({
    super.key,
    required this.dulieu,
  });

  var dulieu;

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: constyle.mautrang,
            elevation: 0,
            title: appbar(),
            automaticallyImplyLeading: false,
            actions: <Widget>[
              IconButton(
                icon: Image.asset("assets/vnicon.png", height: 30),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  IconData(0xe3dc, fontFamily: 'MaterialIcons'),
                  color: Color(0xFF9DA6BA),
                ),
                onPressed: () {},
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
            child: ListView(
              children: [
                Container(
                  height: 200,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Thong tin ca nhan',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold),
                        ),
                        infoitem(
                          info: widget.dulieu['data']['user_profile']
                              ['full_name'],
                          title: 'Name: ',
                          //   infor: infor,
                        ),
                        infoitem(
                          info: widget.dulieu['data']['user_profile']
                              ['birthday'],
                          title: 'Birthday: ',
                          // infor: infor,
                        ),
                        infoitem(
                          info: widget.dulieu['data']['user_profile']['email'],
                          title: 'Email: ',
                          //    infor: infor,
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              SharedPreferences pref =
                                  await SharedPreferences.getInstance();
                              await pref.setString('datatoken', "");
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyHomePage()));
                            },
                            child: Text('Logout')),
                      ]),
                ),
              ],
            ),
          )),
    );
  }
}

class infoitem extends StatelessWidget {
  infoitem({
    super.key,
    required this.title,
    required this.info,
  });

  var textStyle = TextStyle(
    fontSize: 20,
  );

  final String info, title;

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
