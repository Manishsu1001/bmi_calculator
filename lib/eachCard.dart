import 'package:flutter/material.dart';

class cards extends StatelessWidget {
  cards(@required this.color, this.cardChild);
  final Color color;
  final Widget cardChild;
  // final Widget cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.all(12.0),
    );
  }
}
