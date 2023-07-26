import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laboar/blocs/appcubit/app_cubit.dart';
import 'package:laboar/blocs/appcubit/app_state.dart';
import 'package:laboar/generated/l10n.dart';

import 'package:laboar/view/styles/colors.dart';
import 'package:radio_group_v2/radio_group_v2.dart';

import '../../widgets/text_button.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  RadioGroupController radioGroupController = RadioGroupController();

  @override
  Widget build(BuildContext context) {
    String? selectedLangue;
    var media = MediaQuery.of(context).size;
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var Langue;
        return Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.black,
            backgroundColor: Colors.transparent,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          ),
          backgroundColor: backgroundColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(
                    start: media.width * 0.04, end: media.width * 0.04),
                child: Text(
                  S.of(context).SelectLanguage,
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
                    RadioGroup(
                      controller: radioGroupController,
                      values: const ['Arabic', 'English'],
                      onChanged: (value) {
                        selectedLangue = radioGroupController.value.toString();
                      },
                    ),
                    const Divider(),
                    SizedBox(
                      height: media.height * 0.03,
                    ),
                    SizedBox(height: media.height * 0.03),
                    DefaultButton(
                      funq: () {
                        AppCubit.get(context).setLocale(selectedLangue!);
                        Navigator.pop(context);
                      },
                      height: media.height * 0.07,
                      width: media.width * 0.90,
                      text: Text(
                        S.of(context).Save,
                        style: const TextStyle(
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
      },
    );
  }
}
