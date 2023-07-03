import 'package:flutter/material.dart';

class btnmorelogin extends StatelessWidget {
  const btnmorelogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        btn(title: 'Mã Dự Thi'),
        btn(title: 'SSO của Tỉnh',),
      ],
    );
  }
}

class btn extends StatelessWidget {
  btn({
    super.key,
    required this.title,
  });

  String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        side: BorderSide(
            width: 1, color: Color(0xFF005FD0)),
        foregroundColor: Color(0xFF005FD0),
        padding: EdgeInsets.symmetric(
            horizontal: 32, vertical: 8),
      ),
      onPressed: () {},
      child: Text(title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14)),
    );
  }
}