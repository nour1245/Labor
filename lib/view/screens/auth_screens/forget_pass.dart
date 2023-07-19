import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboar/blocs/authcubit/auth_cubit.dart';
import 'package:laboar/blocs/authcubit/auth_state.dart';
import 'package:laboar/view/widgets/text_button.dart';
import 'package:laboar/view/widgets/textformfield.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  TextEditingController phoneController = TextEditingController();

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
          return Scaffold(
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
                    const Center(
                        child: Text(
                      'Forget Password',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
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
                        child: const Text(
                          'Please Enter your Phone '
                          ' to reset password',
                          textAlign: TextAlign.center,
                          style: TextStyle(
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
                        Controller: phoneController,
                        text: 'Phone',
                        keyboardType: TextInputType.phone,
                        hinttext: 'phone number',
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
                      text: const Text(
                        'Reset Password',
                        style: TextStyle(
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
          );
        },
      ),
    );
  }
}
