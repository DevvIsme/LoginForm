import 'package:flutter/material.dart';
import 'package:newapp/constrants.dart';

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
                    color: constyle.mauxanh,
                    fontWeight: FontWeight.bold)))
      ],
    );
  }
}
