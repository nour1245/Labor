import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboar/blocs/authcubit/auth_cubit.dart';
import 'package:laboar/blocs/authcubit/auth_state.dart';
import 'package:laboar/generated/l10n.dart';
import 'package:laboar/view/screens/auth_screens/login.dart';
import 'package:laboar/view/widgets/text_button.dart';
import 'package:laboar/view/widgets/textformfield.dart';
import 'package:toasty_snackbar/toasty_snackbar.dart';

import '../../../blocs/constants/constants.dart';
import '../../../main.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController NameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    NameController.text = userbox!.getAt(0)['name'] ?? 'n';
    phoneController.text = userbox!.getAt(0)['phone'] ?? "p";
    passwordController.text = userbox!.getAt(0)['password'] ?? 'ps';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is SaveNewDataLoadingState) {
          const CircularProgressIndicator.adaptive();
        }
        if (state is SaveNewDataSuccesState) {
          context.showToastySnackbar(S.of(context).Success,
              S.of(context).NewDataSaved, AlertType.success);
        }
        if (state is SaveNewDataErrorState) {
          context.showToastySnackbar(S.of(context).Error,
              S.of(context).Tryaginelater, AlertType.error);
        }
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
                            image: NetworkImage(
                              userbox!.getAt(0) != null
                                  ? userbox!.getAt(0)['photo']
                                  : 'null',
                            ),
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
                        validator: (p1) {
                          if (p1!.isEmpty) {
                            return S.of(context).entervalue;
                          }
                          return null;
                        },
                        Controller: NameController,
                        text: S.of(context).FullName,
                        keyboardType: TextInputType.name,
                        hinttext: NameController.text,
                        obscure: false,
                        suffix: const Icon(Icons.person_outline_sharp),
                      ),
                      DefaultTextForm(
                        validator: (p2) {
                          if (p2!.isEmpty) {
                            return S.of(context).entervalue;
                          }
                          return null;
                        },
                        Controller: phoneController,
                        text: S.of(context).Phone,
                        keyboardType: TextInputType.name,
                        hinttext: phoneController.text,
                        obscure: false,
                        suffix: const Icon(Icons.phone),
                      ),
                      DefaultTextForm(
                        validator: (p3) {
                          if (p3!.isEmpty) {
                            return S.of(context).entervalue;
                          }
                          return null;
                        },
                        Controller: passwordController,
                        text: S.of(context).Password,
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
                        text: Text(
                          S.of(context).SaveChanges,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                        funq: () async {
                          await AuthCubit.get(context).SaveNewData(
                              NameController: NameController,
                              passwordController: passwordController,
                              phoneController: phoneController);
                        },
                      ),
                      SizedBox(
                        height: media.height * 0.09,
                      ),
                      TextButton.icon(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                              Colors.red.withOpacity(0.2),
                            ),
                            iconColor:
                                const MaterialStatePropertyAll(Colors.red)),
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
                              ),
                            );
                          });
                        },
                        icon: const Icon(Icons.delete_outline),
                        label: Text(
                          S.of(context).Deleteaccount,
                          style: const TextStyle(
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
