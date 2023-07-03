import 'package:flutter/material.dart';

class textfieldusername extends StatelessWidget {
  const textfieldusername({
    super.key,
    required this.name,
  });

  final TextEditingController name;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
          color: Color(0xFF141933),
          fontWeight: FontWeight.bold),
      controller: name,
      decoration: InputDecoration(
        labelText: 'Tên tài khoản',
        hintText: 'Tên tài khoản',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Color(0xFFDADEF2), width: 1.0),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Color(0xFFDADEF2), width: 1.0),
          borderRadius: BorderRadius.circular(10),
        ),
        /* border: OutlineInputBorder(
          borderSide:
              BorderSide(color: Color(0xFFDADEF2), width: 1.0),
          borderRadius: BorderRadius.circular(10),
        ),*/
      ),
    );
  }
}

