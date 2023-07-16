import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:laboar/view/styles/colors.dart';

import '../../../generated/l10n.dart';
import '../../widgets/text_button.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var selectedLangue;
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(
              top: media.height * .10,
              start: media.width * 0.05,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Image(
                image: const AssetImage('assets/images/logo.png'),
                width: media.width * 0.34,
                height: media.height * 0.16,
              ),
            ),
          ),
          SizedBox(
            height: media.height * 0.04,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
                start: media.width * 0.04, end: media.width * 0.04),
            child: Text(
              S.of(context).langTitle,
              style: GoogleFonts.quicksand(
                fontSize: 48,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: media.height * 0.08,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
                start: media.width * 0.04, end: media.width * 0.04),
            child: Text(
              'Select Language',
              style: GoogleFonts.quicksand(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: media.height * 0.04,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
                start: media.width * 0.04, end: media.width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'English ',
                      style: GoogleFonts.quicksand(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Radio(
                      fillColor: MaterialStateProperty.all<Color>(greenColor),
                      activeColor: greenColor,
                      value: "en",
                      groupValue: selectedLangue,
                      onChanged: (value) {},
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    Text(
                      'Arabic',
                      style: GoogleFonts.quicksand(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Radio(
                      activeColor: greenColor,
                      fillColor: MaterialStateProperty.all<Color>(greenColor),
                      value: "ar",
                      groupValue: selectedLangue,
                      onChanged: (value) {},
                    ),
                  ],
                ),
                const Divider(),
                SizedBox(
                  height: media.height * 0.03,
                ),
                const Text(
                  "By Creating an account you agrree on our ",
                  style: TextStyle(fontSize: 12),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Terms and conditions",
                    style: TextStyle(color: greenColor),
                  ),
                ),
                SizedBox(height: media.height * 0.03),
                DefaultButton(
                  funq: () {},
                  height: media.height * 0.07,
                  width: media.width * 0.90,
                  text: const Text(
                    'Enter',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
