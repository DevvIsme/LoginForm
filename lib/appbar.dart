import 'package:flutter/material.dart';
import 'package:newapp/constrants.dart';

class appbar extends StatelessWidget {
  const appbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/logo.png',
          fit: BoxFit.contain,
          height: 32,
        ),
        const SizedBox(width: 5),
        const Expanded(
          child: Text(
            'TRƯỜNG THPT CÔNG NGHỆ THÔNG TIN VNPT',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        )
      ],
    );
  }
}
