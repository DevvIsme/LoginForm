import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart';
import 'package:newapp/appbar.dart';
import 'package:newapp/btnmorelogin.dart';
import 'package:newapp/forgetpass.dart';
import 'package:newapp/information.dart';
import 'package:newapp/newacc.dart';
import 'package:newapp/textfieldusername.dart';
import 'package:newapp/titleotherlogin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

var dulieu;
var data;
bool passwordvisible = true;

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController name = TextEditingController();
  TextEditingController pass = TextEditingController();

  void _showAlertDialog(BuildContext context, String stat, String prob) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text(
              "Thông báo",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(stat),
                if (stat == 'Đăng nhập Thất bại !!!') Text(prob)
              ],
            )
            );
      },
    );
  }

  void login(String n, String p, BuildContext context) async {
    //Response capcha = await
    //Capcha();
    setState(() {
      Capcha();
    });
    try {
      Response res = await post(
        Uri.parse(
            'http://lms-school-node1.vnpt.edu.vn/service/security/loginJWT'),
        body: {'email': n, 'password': md5.convert(utf8.encode(p)).toString()},
      );
      // print(res.statusCode);
      if (res.statusCode == 200) {
        data = json.decode(res.body.toString());
        //print(data);
        //print(data['success']);
        if (data['success'] == false) {
          //print('Dang nhap that bai !!!');
          _showAlertDialog(context, "Đăng nhập Thất bại !!!", data['msg']);
          name.text = '';
          pass.text = '';
        } else {
          //print('Dang nhap thanh cong !!!');
          _showAlertDialog(context, "Đăng nhập Thành công !!!", "");
          name.text = '';
          pass.text = '';
          SharedPreferences pref = await SharedPreferences.getInstance();
          await pref.setString('datatoken', data['data']['token']);
          //print(data['data']['token']);
          print(data['data']['token']);
          info(data['data']['token']);
          /*  Navigator.push(context,
            MaterialPageRoute(builder: (context) => InfoPage(tk: data['data']['token'])));*/
        }
      } else {
        print('Extract Token: Failed');

        data = json.decode(res.body.toString());
        //print(data);
      }
    } catch (e) {
      print('From get Token: ' + e.toString());
    }
  }

  void info(var tk) async {
    try {
      Response res = await post(
          Uri.parse(
              'http://lms-school-node1.vnpt.edu.vn/service/user/getUserProfile'),
          headers: <String, String>{'authorization': tk},
          body: {});

      if (res.statusCode == 200) {
        dulieu = jsonDecode(res.body.toString());
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => InfoPage()));
      } else
        print('Extract Info: Failed');
    } catch (e) {
      print('From Gen INF: ' + e.toString());
    }
  }

  Future<void> Capcha() async {
    Response res = await post(
      Uri.parse(
          'http://lms-school-node1.vnpt.edu.vn/test/resetCaptcha?key=c373d05adf87625818d1a478b59975f93ff9c95544910f1b2863a5899882b53f&captchaKey=loginForm'),
      body: {},
    );
  }

  @override
  Widget build(BuildContext context) {
    //loaddata();

    print(data);
    //setState(() { Capcha();});
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
                elevation: 0,
        title: appbar(),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Image.asset("assets/vnicon.png", height: 30),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: Color(0xFFF2F3F5),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  //border: Border.all(color: Color(0xFF141933)),
                  color: Colors.white,
                ),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                     Text(
                      'Đăng nhập',
                      style: TextStyle(
                          fontSize: 30,
                          color: Color(0xFF141933),
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Container(
                        //height: 250,
                        child: Column(
                          children: [
                          newacc(),
                          SizedBox(height:10,),
                          textfieldusername(name: name),
                          SizedBox(height:30,),
                           TextField(
                          controller: pass,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: passwordvisible,
                          style: TextStyle(
                              color: Color(0xFF141933),
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            hintText: 'Mật khẩu',
                            suffixIcon: IconButton(
                              icon: Icon(passwordvisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  passwordvisible = !passwordvisible;
                                });
                              },
                            ),
                            labelText: 'Mật khẩu',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFDADEF2), width: 1.0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFDADEF2), width: 1.0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            /* border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0xFFDADEF2), width: 1.0),
                              borderRadius: BorderRadius.circular(10),
                            ),*/
                          ),
                        ),
                          forgetpass(),
                          Padding(
                            padding: EdgeInsets.only(bottom: 40),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(15),
                                  backgroundColor: Color(0xFF005FD0),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {
                                  login(name.text, pass.text, context);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Đăng nhập',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                )),
                          ),
                          titleotherlogin(),
                          btnmorelogin()
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

