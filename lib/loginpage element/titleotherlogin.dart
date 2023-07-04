import 'package:flutter/material.dart';

class titleotherlogin extends StatelessWidget {
  const titleotherlogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Expanded(
              child: Divider(
            color: Color(0xFFDADEF2),
            thickness: 1,
          )),
          Text('Hoặc đăng nhập bằng',
              style: TextStyle(
                  fontSize: 14, color: Color(0xFF505673))),
          Expanded(
              child: Divider(
            color: Color(0xFFDADEF2),
            thickness: 1,
          )),
        ],
      ),
    );
  }
}



