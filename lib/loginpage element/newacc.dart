import 'package:flutter/material.dart';
import 'package:newapp/constrants.dart';

class newacc extends StatelessWidget {
  const newacc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('Chưa có tài khoản?'),
        TextButton(
            onPressed: () {},
            child: Text(
              'Tạo tài khoản',
              style: TextStyle(
                  fontSize: 14,
                  color: constyle.mauxanh,
                  fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
