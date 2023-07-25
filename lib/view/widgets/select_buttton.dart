import 'package:flutter/material.dart';

import '../styles/colors.dart';

class DSelectButton extends StatelessWidget {
  final bool atDayClicked;
  final IconData icon;
  final String text;
  const DSelectButton(
      {super.key,
      required this.atDayClicked,
      required this.icon,
      required this.text});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: atDayClicked ? yallowColor : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: atDayClicked ? Colors.amber : Colors.white),
      ),
      width: media.width * 0.40,
      height: media.height * .07,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.amber,
            size: media.width * 0.08,
          ),
          SizedBox(
            width: media.width * .01,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
