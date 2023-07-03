import 'package:flutter/material.dart';

class forgetpass extends StatelessWidget {
  const forgetpass({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
            onPressed: () {},
            child: Text('Quên mật khẩu?',
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF005FD0),
                    fontWeight: FontWeight.bold)))
      ],
    );
  }
}

