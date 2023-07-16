import 'package:flutter/material.dart';
import 'package:laboar/view/styles/colors.dart';

class NotActiveMenuButton extends StatelessWidget {
  NotActiveMenuButton({super.key, required this.text, required this.media});
  String text;
  var media;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: lightGrayColor),
        ),
      ],
    );
  }
}
