import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laboar/view/components/text_button.dart';
import 'package:laboar/view/screens/auth_screens/reset_pass.dart';
import 'package:laboar/view/styles/colors.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 60,
    textStyle: GoogleFonts.poppins(
      fontSize: 22,
      color: Colors.black,
    ),
    decoration: BoxDecoration(
      color: lightGrayColor,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: greenColor),
    ),
  );

  TextEditingController pinputController = TextEditingController();
  bool showError = false;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsDirectional.only(top: media.height * 0.10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'OTP',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 28),
                ),
                SizedBox(
                  height: media.height * 0.03,
                ),
                const Column(
                  children: [
                    Text(
                      'An Authentecation code has been sent to',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                    Text(
                      ' (+02) 01003625286  ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: yallowColor),
                    ),
                  ],
                ),
                SizedBox(
                  height: media.height * 0.03,
                ),
                Pinput(
                  controller: pinputController,
                  length: 4,
                  defaultPinTheme: defaultPinTheme,
                  onCompleted: (pin) {
                    setState(() => showError = pin != '5555');
                  },
                  focusedPinTheme: defaultPinTheme.copyWith(
                    height: 68,
                    width: 64,
                    decoration: defaultPinTheme.decoration!.copyWith(
                      border: Border.all(color: greenColor),
                    ),
                  ),
                  errorPinTheme: defaultPinTheme.copyWith(
                    decoration: BoxDecoration(
                      color: redColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(
                  height: media.height * 0.04,
                ),
                DefaultButton(
                  height: media.height * 0.07,
                  width: media.width * 0.90,
                  text: const Text(
                    'Submit',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  funq: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RestPsswordScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: media.height * 0.04,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Code Sent. Resend Code in ',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      ' 00:50',
                      style: TextStyle(
                          color: yallowColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
