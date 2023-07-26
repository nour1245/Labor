import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboar/blocs/authcubit/auth_cubit.dart';
import 'package:laboar/blocs/authcubit/auth_state.dart';
import 'package:laboar/generated/l10n.dart';
import 'package:laboar/view/widgets/text_button.dart';
import 'package:laboar/view/widgets/textformfield.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: Scaffold(
              appBar: AppBar(
                foregroundColor: Colors.black,
                backgroundColor: Colors.transparent,
                elevation: 0,
                systemOverlayStyle: SystemUiOverlayStyle.dark,
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(top: media.height * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                          child: Text(
                        S.of(context).ForgetPassword,
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
                            S.of(context).PleaseEnteryourPhone +
                                S.of(context).toresetpassword,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return S.of(context).pleaseenteravalue;
                            }
                            return null;
                          },
                          Controller: phoneController,
                          text: S.of(context).Phone,
                          keyboardType: TextInputType.phone,
                          hinttext: S.of(context).phonenumber,
                          obscure: false,
                          suffix: const Icon(Icons.phone),
                        ),
                      ),
                      SizedBox(
                        height: media.height * 0.03,
                      ),
                      DefaultButton(
                        height: media.height * 0.07,
                        width: media.width * .90,
                        text: Text(
                          S.of(context).ResetPassword,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        funq: () {
                          AuthCubit.get(context)
                              .phoneVerification(phoneController.text, context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
