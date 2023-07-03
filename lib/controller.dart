/*import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:newapp/information.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'loginpage.dart';

class control extends StatelessWidget
{
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
    // TODO: implement build
    throw UnimplementedError();
  }
}
*/
