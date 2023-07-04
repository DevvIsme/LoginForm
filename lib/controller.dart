import 'dart:async';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:newapp/information.dart';
import 'package:shared_preferences/shared_preferences.dart';

class control {
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
            ));
      },
    );
  }

  void login(TextEditingController n, TextEditingController p,
      BuildContext context) async {
    var _data;
    try {
      Response res = await post(
        Uri.parse(
            'http://lms-school-node1.vnpt.edu.vn/service/security/loginJWT'),
        body: {
          'email': n.text,
          'password': md5.convert(utf8.encode(p.text)).toString()
        },
      );
      if (res.statusCode == 200) {
        _data = json.decode(res.body.toString());
        if (_data['success'] == false) {
          _showAlertDialog(context, "Đăng nhập Thất bại !!!", _data['msg']);
          n.text = '';
          p.text = '';
        } else {
          _showAlertDialog(context, "Đăng nhập Thành công !!!", "");
          n.text = '';
          p.text = '';
          SharedPreferences pref = await SharedPreferences.getInstance();
          await pref.setString('datatoken', _data['data']['token']);
          info(_data['data']['token'], context);
        }
      } else {
        print('Extract Token: Failed');

        _data = json.decode(res.body.toString());
      }
    } catch (e) {
      print('From get Token: ' + e.toString());
    }
  }

  void info(var tk, BuildContext context) async {
    var _dulieu;
    try {
      Response res = await post(
          Uri.parse(
              'http://lms-school-node1.vnpt.edu.vn/service/user/getUserProfile'),
          headers: <String, String>{'authorization': tk},
          body: {});

      if (res.statusCode == 200) {
        _dulieu = jsonDecode(res.body.toString());
        Timer(
            Duration(seconds: 1),
            () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => InfoPage(
                          dulieu: _dulieu,
                        ))));
      } else
        print('Extract Info: Failed');
    } catch (e) {
      print('From Gen INF: ' + e.toString());
    }
  }
}
