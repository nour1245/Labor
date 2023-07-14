import 'package:flutter/material.dart';
import 'package:laboar/view/styles/colors.dart';

class DefaultTextForm extends StatelessWidget {
  DefaultTextForm({
    super.key,
    required this.Controller,
    required this.text,
    required this.keyboardType,
    required this.hinttext,
    required this.obscure,
    required this.suffix,
  });

  TextEditingController Controller;
  String text;
  Icon? suffix;
  bool obscure = false;
  TextInputType keyboardType;
  String hinttext;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: media.height * .01,
        ),
        TextFormField(
          keyboardType: keyboardType,
          obscureText: obscure,
          controller: Controller,
          decoration: InputDecoration(
            hintText: hinttext,
            filled: true,
            fillColor: greenColor.withOpacity(0.10),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: greenColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: lightGrayColor),
            ),
            suffixIconColor: lightGrayColor,
            suffixIcon: suffix,
          ),
        ),
      ],
    );
  }
}
