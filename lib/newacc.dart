import 'package:flutter/material.dart';

class newacc extends StatelessWidget {
  const newacc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('Chưa có tài khoản?'),
        TextButton(
            onPressed: () {},
            child: Text(
              'Tạo tài khoản',
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF005FD0),
                  fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
