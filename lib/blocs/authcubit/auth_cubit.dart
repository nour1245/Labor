import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:laboar/blocs/constants/constants.dart';
import 'package:laboar/main.dart';
import 'package:laboar/model/usermodel.dart';
import 'package:laboar/view/screens/auth_screens/otp.dart';
import 'package:laboar/view/screens/home_screens/layout.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  //send phone otp
  phoneVerification(phonenumber, context) async {
    emit(PhoneVerificationLoading());
    await firebaseauth.verifyPhoneNumber(
      phoneNumber: phonenumber,
      verificationCompleted: (phoneAuthCredential) {
        emit(PhoneVerificationSucces());
      },
      verificationFailed: (error) {
        emit(PhoneVerificationError());
        print(error.toString());
      },
      codeSent: (verificationId, forceResendingToken) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => OtpScreen(verificationId: verificationId),
        ));
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }

//otp screen
  signIn(verificationId, smsCode, context) async {
    emit(OtpVerificationLoading());
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    try {
      await firebaseauth.signInWithCredential(credential);
      emit(OtpVerificationSucces());

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LayoutScreen(),
        ),
      );
    } catch (e) {
      emit(OtpVerificationError());
      print(e.toString());
    }
  }

//create user in firestore database
  createUser(name, password, phone) async {
    UserModel usermodel = UserModel(
      name: name,
      password: password,
      phone: phone,
      photo:
          "https://www.pngkey.com/png/detail/57-576740_black-person-png-businessperson.png",
    );
    await firebaseFirestore
        .collection('users')
        .doc("user${usermodel.phone}")
        .set(usermodel.toMap())
        .then((value) {
      emit(CreateUserSuccessState());
    }).catchError((e) {
      emit(CreateUserErrorState());
    });
  }

//google login
  Future<UserCredential> signInWithGoogle(context) async {
    emit(SignInWithGoogleLoading());
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    emit(SignInWithGoogleSucess());

    // Once signed in, return the UserCredential

    if (googleUser != null) {
      await createUser(googleUser.displayName, '', googleUser.email);
      await firebaseFirestore
          .collection('users')
          .doc('user${googleUser.email}')
          .get()
          .then((value) {
        currentuser = value.data();
        userbox!.add(currentuser);
      }).catchError((e) {
        print(e.toString());
      });
    }
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LayoutScreen(),
        ));
    return await firebaseauth.signInWithCredential(credential);
  }

//facebook login
  Future<UserCredential> signInWithFacebook() async {
    emit(SignInWithFacebookLoading());
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    emit(SignInWithFacebookSucess());
    // Once signed in, return the UserCredential
    FacebookAuth.instance.getUserData().then((value) {
      currentuser = value;
      userbox!.add(currentuser);
    });

    return firebaseauth.signInWithCredential(facebookAuthCredential);
  }

//login with phone and password
  userLogin(phone, password, context) async {
    emit(LoginLoadingState());
    await firebaseFirestore.collection('users').doc("user$phone").get().then(
      (value) {
        currentuser = value.data();
        userbox!.add(currentuser);
        currentuser!.forEach(
          (key, value) {
            if (key == 'password') {
              if (value == password) {
                emit(LoginSuccessState());
                print('---------------userInfo----------------------');
                print(currentuser!['name']);
                print('----------------userInfo---------------------');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LayoutScreen(),
                    ));
              } else {
                emit(LoginErrorState("user Not Found"));
              }
            }
          },
        );
      },
    );
  }

  SaveNewData({passwordController, phoneController, NameController}) async {
    emit(SaveNewDataLoadingState());
    var newvalue = {
      "uId": null,
      "password": passwordController.text,
      "phone": phoneController.text,
      "name": NameController.text,
      "photo":
          'https://www.pngkey.com/png/detail/57-576740_black-person-png-businessperson.png'
    };
    await firebaseFirestore
        .collection('users')
        .doc('user${userbox!.getAt(0)['phone']}')
        .set(newvalue)
        .then((value) {
      userbox!.putAt(0, newvalue);
      emit(SaveNewDataSuccesState());
    }).catchError((error) {
      emit(SaveNewDataErrorState());
    });
  }

  getUserData() async {
    emit(getUserDataLoad());
    await firebaseFirestore
        .collection('users')
        .doc('user${currentuser['phone']}')
        .get()
        .then((value) {
      currentuser = value.data();
      emit(getUserDataSuccess());
    }).catchError((e) {
      emit(getUserDataError());
    });
  }
}
