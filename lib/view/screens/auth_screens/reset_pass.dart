import 'package:flutter/material.dart';
import 'package:laboar/generated/l10n.dart';
import 'package:laboar/view/widgets/text_button.dart';
import 'package:laboar/view/widgets/textformfield.dart';

class RestPsswordScreen extends StatelessWidget {
  RestPsswordScreen({super.key});

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _key,
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsDirectional.only(top: media.height * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                    child: Text(
                  S.of(context).ResetPassword,
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.w700),
                )),
                SizedBox(
                  height: media.height * 0.02,
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: media.width * 0.15,
                      end: media.width * 0.15,
                    ),
                    child: Text(
                      S.of(context).Createstrongandsecured +
                          S.of(context).newpassword,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(
                  height: media.height * 0.03,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: media.width * 0.07,
                    end: media.width * 0.07,
                  ),
                  child: DefaultTextForm(
                    validator: (p2) {
                      if (p2!.isEmpty) {
                        return S.of(context).entervalue;
                      }
                      return null;
                    },
                    Controller: passwordController,
                    text: S.of(context).Password,
                    keyboardType: TextInputType.visiblePassword,
                    hinttext: S.of(context).Enteryourpassword,
                    obscure: true,
                    suffix: const Icon(Icons.remove_red_eye_outlined),
                  ),
                ),
                SizedBox(
                  height: media.height * 0.02,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: media.width * 0.07,
                    end: media.width * 0.07,
                  ),
                  child: DefaultTextForm(
                    validator: (p1) {
                      if (p1!.isEmpty) {
                        return S.of(context).entervalue;
                      }
                      return null;
                    },
                    Controller: confirmPasswordController,
                    text: S.of(context).ConfirmPassword,
                    keyboardType: TextInputType.visiblePassword,
                    hinttext: S.of(context).Confirmyourpassword,
                    obscure: true,
                    suffix: const Icon(Icons.remove_red_eye_outlined),
                  ),
                ),
                SizedBox(
                  height: media.height * 0.03,
                ),
                DefaultButton(
                  height: media.height * 0.07,
                  width: media.width * .90,
                  text: Text(
                    S.of(context).SavePassword,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  funq: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
