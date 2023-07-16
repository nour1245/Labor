import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboar/blocs/authcubit/auth_cubit.dart';
import 'package:laboar/blocs/authcubit/auth_state.dart';
import 'package:laboar/view/screens/auth_screens/otp.dart';
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
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsetsDirectional.only(top: media.height * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Center(
                        child: Text(
                      'Register',
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
                          'Please Enter your Phone and password'
                          ' to continue',
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
                        Controller: NameController,
                        text: 'Name',
                        keyboardType: TextInputType.name,
                        hinttext: 'your name',
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
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        start: media.width * 0.07,
                        end: media.width * 0.07,
                      ),
                      child: DefaultTextForm(
                        Controller: passwordController,
                        text: 'Password',
                        keyboardType: TextInputType.visiblePassword,
                        hinttext: 'Enter your password',
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
                      text: const Text(
                        'Register',
                        style: TextStyle(
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
                    const Text("OR"),
                    SizedBox(
                      height: media.height * 0.03,
                    ),
                    InkWell(
                      onTap: () {
                        AuthCubit.get(context).signInWithFacebook();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: greenColor.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: media.width * 0.90,
                        height: media.height * 0.08,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                                image:
                                    AssetImage('assets/images/face_icon.png')),
                            SizedBox(
                              width: 8,
                            ),
                            Text('Facebook'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: media.height * 0.03,
                    ),
                    InkWell(
                      onTap: () {
                        AuthCubit.get(context).signInWithGoogle();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: greenColor.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: media.width * 0.90,
                        height: media.height * 0.08,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                                image: AssetImage(
                                    'assets/images/google_icon.png')),
                            SizedBox(
                              width: 8,
                            ),
                            Text('Google'),
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
                          'Have an Account ? ',
                          style: TextStyle(
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
                            'Sign in',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
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
