import 'package:flutter/material.dart';

class ActiveMenuButton extends StatelessWidget {
  ActiveMenuButton({super.key, required this.text, required this.media});
  String text;
  var media;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(top: media.height * 0.007),
          child: Container(
            width: media.width * 0.03,
            height: media.height * 0.007,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xff5fd068),
            ),
          ),
        )
      ],
    );
  }
}
