import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:laboar/generated/l10n.dart';
import 'package:laboar/main.dart';

import 'package:laboar/view/widgets/text_button.dart';
import 'package:laboar/view/widgets/textformfield.dart';

class AddCard extends StatelessWidget {
  AddCard({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController expDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController indexController = TextEditingController();
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Form(
      key: _key,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsetsDirectional.all(media.height * .03),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                width: media.width,
                height: media.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultTextForm(
                        validator: (p2) {
                          if (p2!.isEmpty) {
                            return S.of(context).entervalue;
                          }
                          return null;
                        },
                        Controller: nameController,
                        text: S.of(context).CardName,
                        keyboardType: TextInputType.name,
                        hinttext: '',
                        obscure: false,
                        suffix: null),
                    SizedBox(
                      height: media.height * 0.02,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                          bottom: media.height * 0.01),
                      child: Text(
                        S.of(context).CardType,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
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
                          inputDecorationTheme: const InputDecorationTheme(
                            border: InputBorder.none,
                          ),
                          label: Text(S.of(context).CardType),
                          width: media.width * 0.70,
                          controller: typeController,
                          dropdownMenuEntries: const [
                            DropdownMenuEntry(value: 'visa', label: 'Visa'),
                            DropdownMenuEntry(
                                value: 'master', label: 'Master Card')
                          ]),
                    ),
                    DefaultTextForm(
                        validator: (p3) {
                          if (p3!.isEmpty) {
                            return S.of(context).entervalue;
                          }
                          return null;
                        },
                        Controller: numberController,
                        text: S.of(context).cardNumber,
                        keyboardType: TextInputType.name,
                        hinttext: '',
                        obscure: false,
                        suffix: null),
                    DefaultTextForm(
                        validator: (p4) {
                          if (p4!.isEmpty) {
                            return S.of(context).entervalue;
                          }
                          return null;
                        },
                        Controller: expDateController,
                        text: S.of(context).Expdate,
                        keyboardType: TextInputType.name,
                        hinttext: '',
                        obscure: false,
                        suffix: null),
                    DefaultTextForm(
                        validator: (p5) {
                          if (p5!.isEmpty) {
                            return S.of(context).entervalue;
                          }
                          return null;
                        },
                        Controller: cvvController,
                        text: "Cvv",
                        keyboardType: TextInputType.name,
                        hinttext: '',
                        obscure: false,
                        suffix: null),
                    SizedBox(
                      height: media.height * 0.06,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                          bottom: media.height * 0.04),
                      child: DefaultButton(
                        height: media.height * .06,
                        width: media.width * 0.90,
                        text: Text(S.of(context).Save),
                        funq: () async {
                          await saveCardDetails(context);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> saveCardDetails(context) async {
    final cardMap = {
      "cardName": nameController.text,
      "cardNumber": numberController.text,
      "cardType": typeController.text,
      "expDate": expDateController.text,
      "cvv": cvvController.text,
    };

    await mybox!.add(cardMap);
    Navigator.pop(context);
    if (kDebugMode) {
      print(mybox!.length);
    }
  }
}
