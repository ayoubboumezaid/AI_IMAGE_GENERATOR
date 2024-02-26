// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, unused_import
import 'package:flutter/material.dart';

import 'package:iaappp/misc/colors.dart';
import 'package:iaappp/widgets/app_text.dart';

class AppButton extends StatelessWidget {
  String? text;
  IconData? icon;
  bool? isIcon;
  final Color color;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  AppButton({
    Key? key,
    this.text,
    this.isIcon=false,
    this.icon,
    required this.color,
    required this.backgroundColor,
    required this.size,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 1.0),
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor),
        child: isIcon == false
  ? Center(child: AppText(text: text ?? '',color: color,)) 
  : Center(child: Icon(icon, color: color)),

    );
  }
}
