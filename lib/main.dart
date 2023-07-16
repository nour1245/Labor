import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laboar/firebase_options.dart';
import 'package:laboar/view/screens/auth_screens/login.dart';
import 'package:laboar/view/screens/auth_screens/otp.dart';
import 'package:laboar/view/screens/auth_screens/register.dart';
import 'package:laboar/view/screens/home_screens/layout.dart';
import 'package:laboar/view/screens/welcome_pages/language_screen.dart';
import 'package:laboar/view/screens/welcome_pages/onboard.dart';

import 'blocs/bloc_observer.dart';
import 'generated/l10n.dart';
import 'view/screens/home_screens/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.quicksandTextTheme()),
      locale: Locale('en'),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      title: 'Labor',
      home: LoginScreen(),
    );
  }
}
