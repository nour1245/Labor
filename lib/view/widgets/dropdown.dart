import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../styles/colors.dart';

class Dropdown extends StatefulWidget {
  List<String> items;
  var selectedValue;
  var title;
  Dropdown(
      {super.key,
      required this.items,
      required this.selectedValue,
      required this.title});

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            items: widget.items
                .map(
                  (String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                )
                .toList(),
            value: widget.selectedValue,
            onChanged: (value) {
              setState(() {
                widget.selectedValue = value;
              });
            },
            isExpanded: true,
            dropdownStyleData: const DropdownStyleData(
              decoration: BoxDecoration(color: Colors.white),
            ),
            menuItemStyleData: const MenuItemStyleData(
              overlayColor: MaterialStatePropertyAll(greenColor),
            ),
          ),
        ),
      ],
    );
  }
}
