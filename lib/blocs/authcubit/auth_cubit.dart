import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:laboar/blocs/constants/constants.dart';
import 'package:laboar/model/usermodel.dart';
import 'package:laboar/view/screens/auth_screens/otp.dart';
import 'package:laboar/view/screens/home_screens/homepage.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  phoneVerification(phonenumber, context) async {
    emit(PhoneVerificationLoading());
    await firebaseauth.verifyPhoneNumber(
      phoneNumber: phonenumber,
      verificationCompleted: (phoneAuthCredential) {
        PhoneAuthCredential credential = phoneAuthCredential;
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

  signIn(verificationId, smsCode, context) async {
    emit(OtpVerificationLoading());
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    print("-------------Signcredential---------------");
    print(credential);

    print("-------------Signcredential---------------");
    try {
      await firebaseauth.signInWithCredential(credential);
      emit(OtpVerificationSucces());

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } catch (e) {
      emit(OtpVerificationError());
      print(e.toString());
    }
  }

  createUser(name, password, phone) {
    UserModel usermodel = UserModel(
      name: name,
      password: password,
      phone: phone,
      photo:
          "https://www.pngkey.com/png/detail/57-576740_black-person-png-businessperson.png",
    );
    firebaseFirestore
        .collection('users')
        .doc("user${usermodel.phone}")
        .set(usermodel.toMap())
        .then((value) {
      emit(CreateUserSuccessState());
    }).catchError((e) {
      emit(CreateUserErrorState());
    });
  }

  Future<UserCredential> signInWithGoogle() async {
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
    print("---------------Goglecredential-----------");
    print(credential);
    print("---------------Goglecredential-----------");
    return await firebaseauth.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    emit(SignInWithFacebookLoading());
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    emit(SignInWithFacebookSucess());
    // Once signed in, return the UserCredential
    print("---------------facecredential-----------");
    print(facebookAuthCredential);
    print("---------------Facecredential-----------");
    return firebaseauth.signInWithCredential(facebookAuthCredential);
  }

  signOut() async {
    await firebaseauth.signOut();
    emit(SignOut());
  }
}
