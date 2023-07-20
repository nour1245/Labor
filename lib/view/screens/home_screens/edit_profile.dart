import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboar/blocs/authcubit/auth_cubit.dart';
import 'package:laboar/blocs/authcubit/auth_state.dart';
import 'package:laboar/view/screens/auth_screens/login.dart';
import 'package:laboar/view/styles/colors.dart';
import 'package:laboar/view/widgets/text_button.dart';
import 'package:laboar/view/widgets/textformfield.dart';

import '../../../blocs/constants/constants.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({super.key});
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController NameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    NameController.text = '${currentuser['name']}';
    phoneController.text = '${currentuser['phone']}';
    passwordController.text = '${currentuser['password']}';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    width: media.height * 0.10,
                    height: media.height * 0.10,
                    child: InkWell(
                      onTap: () {},
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image(
                            fit: BoxFit.contain,
                            image: NetworkImage('${currentuser['photo']}'),
                          ),
                          const Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      top: media.height * 0.03,
                      end: media.height * 0.03,
                      start: media.height * 0.03),
                  child: Column(
                    children: [
                      DefaultTextForm(
                        Controller: NameController,
                        text: 'Full Name',
                        keyboardType: TextInputType.name,
                        hinttext: NameController.text,
                        obscure: false,
                        suffix: const Icon(Icons.person_outline_sharp),
                      ),
                      DefaultTextForm(
                        Controller: phoneController,
                        text: 'Phone',
                        keyboardType: TextInputType.name,
                        hinttext: phoneController.text,
                        obscure: false,
                        suffix: const Icon(Icons.phone),
                      ),
                      DefaultTextForm(
                        Controller: passwordController,
                        text: 'Password',
                        keyboardType: TextInputType.name,
                        hinttext: passwordController.text,
                        obscure: true,
                        suffix: const Icon(Icons.remove_red_eye_outlined),
                      ),
                      SizedBox(
                        height: media.height * 0.04,
                      ),
                      DefaultButton(
                          height: media.height * 0.08,
                          width: media.width * 0.90,
                          text: const Text(
                            'Save Changes',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 18),
                          ),
                          funq: () {}),
                      SizedBox(
                        height: media.height * 0.09,
                      ),
                      TextButton.icon(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                              Colors.red.withOpacity(0.2),
                            ),
                            iconColor: MaterialStatePropertyAll(Colors.red)),
                        onPressed: () async {
                          await firebaseFirestore
                              .collection("users")
                              .doc('user${currentuser['phone']}')
                              .delete()
                              .then((value) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ));
                          });
                        },
                        icon: const Icon(Icons.delete_outline),
                        label: const Text(
                          'Delete account',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
