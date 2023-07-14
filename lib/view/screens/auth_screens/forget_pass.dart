import 'package:flutter/material.dart';
import 'package:laboar/view/components/button.dart';
import 'package:laboar/view/components/textformfield.dart';
import 'package:laboar/view/screens/auth_screens/otp.dart';
import 'package:laboar/view/styles/colors.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
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
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
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
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OtpScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
