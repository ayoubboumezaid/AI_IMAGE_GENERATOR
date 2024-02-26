// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppLargText extends StatelessWidget {
  double size;
  final Color color;
  final String text;
  AppLargText({
    Key? key,
    required this.text,
    this.size = 30,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size,
          color: color,
          fontWeight: FontWeight.bold,
          fontFamily: "Exo"),
    );
  }
}
