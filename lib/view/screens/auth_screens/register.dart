import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboar/blocs/authcubit/auth_cubit.dart';
import 'package:laboar/blocs/authcubit/auth_state.dart';
import 'package:laboar/generated/l10n.dart';
import 'package:laboar/view/widgets/text_button.dart';
import 'package:laboar/view/widgets/textformfield.dart';
import 'package:laboar/view/screens/auth_screens/login.dart';
import 'package:laboar/view/styles/colors.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  TextEditingController NameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Form(
            key: key,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(top: media.height * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                          child: Text(
                        S.of(context).Register,
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
                            S.of(context).PleaseEnteryourPhoneandpassword +
                                S.of(context).tocontinue,
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
                          validator: (p3) {
                            if (p3!.isEmpty) {
                              return S.of(context).entervalue;
                            }
                            return null;
                          },
                          Controller: NameController,
                          text: S.of(context).Name,
                          keyboardType: TextInputType.name,
                          hinttext: S.of(context).yourname,
                          obscure: false,
                          suffix: const Icon(Icons.person),
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
                          validator: (p2) {
                            if (p2!.isEmpty) {
                              return S.of(context).entervalue;
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
                          Controller: passwordController,
                          text: S.of(context).Password,
                          keyboardType: TextInputType.visiblePassword,
                          hinttext: S.of(context).Enteryourpassword,
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
                          S.of(context).Register,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        funq: () async {
                          await AuthCubit.get(context)
                              .phoneVerification(phoneController.text, context);
                          await AuthCubit.get(context).createUser(
                              NameController.text,
                              passwordController.text,
                              phoneController.text);
                        },
                      ),
                      SizedBox(
                        height: media.height * 0.03,
                      ),
                      Text(S.of(context).OR),
                      SizedBox(
                        height: media.height * 0.03,
                      ),
                      InkWell(
                        onTap: () async {
                          await AuthCubit.get(context).signInWithFacebook();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: greenColor.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          width: media.width * 0.90,
                          height: media.height * 0.08,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Image(
                                  image: AssetImage(
                                      'assets/images/face_icon.png')),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(S.of(context).Facebook),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: media.height * 0.03,
                      ),
                      InkWell(
                        onTap: () async {
                          await AuthCubit.get(context)
                              .signInWithGoogle(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: greenColor.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          width: media.width * 0.90,
                          height: media.height * 0.08,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Image(
                                image:
                                    AssetImage('assets/images/google_icon.png'),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(S.of(context).Google),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: media.height * .01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            S.of(context).HaveanAccount,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                            },
                            child: Text(
                              S.of(context).Signin,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
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
