import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:laboar/generated/l10n.dart';
import 'package:laboar/main.dart';
import 'package:laboar/view/widgets/text_button.dart';
import 'package:laboar/view/widgets/textformfield.dart';

class AddAdressScreen extends StatelessWidget {
  TextEditingController cityController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController buildingController = TextEditingController();
  final _key = GlobalKey<FormState>();
  AddAdressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _key,
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).addAddress),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: Padding(
          padding: EdgeInsetsDirectional.only(
              top: media.width * 0.25,
              end: media.width * 0.05,
              start: media.width * 0.05),
          child: SingleChildScrollView(
            child: Column(
              children: [
                DefaultTextForm(
                  Controller: cityController,
                  text: S.of(context).City,
                  keyboardType: TextInputType.text,
                  hinttext: S.of(context).City,
                  obscure: false,
                  suffix: null,
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return S.of(context).entervalue;
                    }
                    return null;
                  },
                ),
                DefaultTextForm(
                  Controller: areaController,
                  text: S.of(context).Area,
                  keyboardType: TextInputType.text,
                  hinttext: S.of(context).Area,
                  obscure: false,
                  suffix: null,
                  validator: (p1) {
                    if (p1!.isEmpty) {
                      return S.of(context).entervalue;
                    }
                    return null;
                  },
                ),
                DefaultTextForm(
                  Controller: streetController,
                  text: S.of(context).Street,
                  keyboardType: TextInputType.text,
                  hinttext: S.of(context).Street,
                  obscure: false,
                  suffix: null,
                  validator: (p2) {
                    if (p2!.isEmpty) {
                      return S.of(context).entervalue;
                    }
                    return null;
                  },
                ),
                DefaultTextForm(
                  Controller: buildingController,
                  text: S.of(context).buildnumber,
                  keyboardType: TextInputType.text,
                  hinttext: S.of(context).buildnumber,
                  obscure: false,
                  suffix: null,
                  validator: (p3) {
                    if (p3!.isEmpty) {
                      return S.of(context).entervalue;
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: media.height * 0.05,
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.only(bottom: media.height * 0.04),
                  child: DefaultButton(
                    height: media.height * .06,
                    width: media.width * 0.90,
                    text: Text(S.of(context).Save),
                    funq: () async {
                      var value = {
                        "city": cityController.text,
                        "area": areaController.text,
                        "street": streetController.text,
                        "building": buildingController.text,
                      };
                      await address!.add(value).then((value) {
                        Navigator.pop(context);
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
