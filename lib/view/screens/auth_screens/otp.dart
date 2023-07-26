import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laboar/blocs/authcubit/auth_cubit.dart';
import 'package:laboar/blocs/authcubit/auth_state.dart';
import 'package:laboar/generated/l10n.dart';
import 'package:laboar/view/screens/home_screens/homepage.dart';
import 'package:laboar/view/widgets/text_button.dart';
import 'package:laboar/view/styles/colors.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  const OtpScreen({super.key, required this.verificationId});

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
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (AuthStates is OtpVerificationSucces) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          }
        },
        builder: (context, state) {
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
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 28),
                      ),
                      SizedBox(
                        height: media.height * 0.03,
                      ),
                      Column(
                        children: [
                          Text(
                            S.of(context).AnAuthentecationcodehasbeensentto,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14),
                          ),
                          const Text(
                            '',
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
                        length: 6,
                        defaultPinTheme: defaultPinTheme,
                        onCompleted: (pin) {},
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
                        text: Text(
                          S.of(context).Submit,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        funq: () {
                          AuthCubit.get(context).signIn(widget.verificationId,
                              pinputController.text, context);
                        },
                      ),
                      SizedBox(
                        height: media.height * 0.04,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            S.of(context).CodeSentResendCodein,
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          const Text(
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
        },
      ),
    );
  }
}
