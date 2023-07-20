import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:laboar/view/styles/colors.dart';
import 'package:laboar/view/widgets/text_button.dart';
import 'package:laboar/view/widgets/textformfield.dart';

class AddCard extends StatelessWidget {
  AddCard({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController expDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.all(media.height * .03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultTextForm(
                  Controller: nameController,
                  text: "Card Name",
                  keyboardType: TextInputType.name,
                  hinttext: '',
                  obscure: false,
                  suffix: null),
              SizedBox(
                height: media.height * 0.02,
              ),
              Padding(
                padding:
                    EdgeInsetsDirectional.only(bottom: media.height * 0.01),
                child: Text(
                  'Card Type',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                color: Colors.green.withOpacity(0.1),
                alignment: Alignment.center,
                width: media.width * 0.90,
                child: DropdownMenu(
                    onSelected: (value) {
                      typeController.text = value!;
                    },
                    inputDecorationTheme: InputDecorationTheme(
                      border: InputBorder.none,
                    ),
                    label: Text('Card Type'),
                    width: media.width * 0.70,
                    controller: typeController,
                    dropdownMenuEntries: [
                      DropdownMenuEntry(value: 'visa', label: 'Visa'),
                      DropdownMenuEntry(value: 'master', label: 'Master Card')
                    ]),
              ),
              DefaultTextForm(
                  Controller: numberController,
                  text: "Card Number",
                  keyboardType: TextInputType.name,
                  hinttext: '',
                  obscure: false,
                  suffix: null),
              DefaultTextForm(
                  Controller: expDateController,
                  text: "Exp date",
                  keyboardType: TextInputType.name,
                  hinttext: '',
                  obscure: false,
                  suffix: null),
              DefaultTextForm(
                  Controller: cvvController,
                  text: "Cvv",
                  keyboardType: TextInputType.name,
                  hinttext: '',
                  obscure: false,
                  suffix: null),
              Spacer(),
              Padding(
                padding:
                    EdgeInsetsDirectional.only(bottom: media.height * 0.04),
                child: DefaultButton(
                    height: media.height * .06,
                    width: media.width * 0.90,
                    text: Text('Save'),
                    funq: () {}),
              )
            ],
          ),
        ),
      ),
    );
  }
}
