import 'package:flutter/material.dart';
import 'package:laboar/view/styles/colors.dart';

// ignore: must_be_immutable
class DefaultButton extends StatelessWidget {
  var width;
  var height;
  Function() funq;
  Text text;
  DefaultButton(
      {super.key,
      required this.height,
      required this.width,
      required this.text,
      required this.funq});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: funq,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: bottomColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: text,
      ),
    );
  }
}
