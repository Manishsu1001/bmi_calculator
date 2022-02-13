import 'package:flutter/material.dart';
import 'package:bmicalculator/consts.dart';
class gender extends StatelessWidget {
  gender(this.icon,this.text);
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
          color: Color(0xFFFFFFFF),
        ),
        SizedBox(
          height: 20.0,
        )
        ,
        Text(text,style: small)
      ],
    );
  }
}
