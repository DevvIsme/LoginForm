import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:newapp/appbar.dart';
import 'package:newapp/loginpage%20element/btnmorelogin.dart';
import 'package:newapp/constrants.dart';
import 'package:newapp/controller.dart';
import 'package:newapp/loginpage%20element/forgetpass.dart';
import 'package:newapp/loginpage%20element/newacc.dart';
import 'package:newapp/loginpage%20element/titleotherlogin.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController name = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool valipass = false;
  bool valiname = false;
  var data;
  bool passwordvisible = true;
  final _loginkey = GlobalKey<FormState>;
  control ctl = control();
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

  Future<void> Capcha() async {
    Response res = await post(
      Uri.parse(
          'http://lms-school-node1.vnpt.edu.vn/test/resetCaptcha?key=c373d05adf87625818d1a478b59975f93ff9c95544910f1b2863a5899882b53f&captchaKey=loginForm'),
      body: {},
    );
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      Capcha();
    });
    print(data);
    return Scaffold(
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
        ],
      ),
      body: Container(
        color: constyle.mautrang,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: constyle.mautrang,
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Đăng nhập',
                      style: TextStyle(
                          fontSize: 30,
                          color: constyle.mauden,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Container(
                        child: Column(children: [
                          newacc(),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            onChanged: (content) {
                              setState(() {
                                if (!name.text.isEmpty)
                                  valiname = false;
                                else
                                  valiname = true;
                              });
                            },
                            style: TextStyle(
                                color: constyle.mauden,
                                fontWeight: FontWeight.bold),
                            controller: name,
                            decoration: InputDecoration(
                              labelText: 'Tên tài khoản',
                              hintText: 'Tên tài khoản',
                              errorText: valiname ? 'Hãy nhập mật khẩu' : null,
                              enabledBorder: constyle.outlineInputBorder,
                              focusedBorder: constyle.outlineInputBorder,
                              border: constyle.outlineInputBorder,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            onChanged: (content) {
                              setState(() {
                                if (!pass.text.isEmpty)
                                  valipass = false;
                                else
                                  valipass = true;
                              });
                            },
                            controller: pass,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: passwordvisible,
                            style: TextStyle(
                                color: constyle.mauden,
                                fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              errorText: valipass ? 'Hãy nhập mật khẩu' : null,
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
                              enabledBorder: constyle.outlineInputBorder,
                              focusedBorder: constyle.outlineInputBorder,
                              border: constyle.outlineInputBorder,
                            ),
                          ),
                          forgetpass(),
                          Padding(
                            padding: EdgeInsets.only(bottom: 40),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(15),
                                  backgroundColor: constyle.mauxanh,
                                  foregroundColor: constyle.mautrang,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    pass.text.isEmpty
                                        ? valipass = true
                                        : valipass = false;
                                    name.text.isEmpty
                                        ? valiname = true
                                        : valiname = false;
                                  });
                                  if (valiname == false && valipass == false) {
                                    ctl.login(name, pass, context);
                                  }
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
