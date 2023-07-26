import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:laboar/blocs/appcubit/app_cubit.dart';
import 'package:laboar/blocs/authcubit/auth_cubit.dart';
import 'package:laboar/firebase_options.dart';
import 'package:laboar/helper.dart';
import 'package:laboar/view/screens/splashscreen.dart';
import 'package:path_provider/path_provider.dart';

import 'blocs/bloc_observer.dart';
import 'generated/l10n.dart';

Box? mybox;
Box? userbox;
Box? ordersBox;
Box? address;
Box? localebox;
openHiveBox(String boxname) async {
  if (!Hive.isBoxOpen(boxname)) {
    Hive.init((await getApplicationDocumentsDirectory()).path);
  }
  return await Hive.openBox(boxname);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  mybox = await openHiveBox('cardBox');
  userbox = await openHiveBox('Userbox');
  ordersBox = await openHiveBox('orders');
  address = await openHiveBox('address');
  localebox = await openHiveBox('locale');
  await CacheHelper.init();

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

var onBord;
var locale;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    print(localebox!.getAt(localebox!.length - 1));
    setState(() {
      if (localebox!.isNotEmpty) {
        locale = Locale(localebox!.getAt(localebox!.length - 1));
      }
    });

    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => AppCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(textTheme: GoogleFonts.quicksandTextTheme()),
        locale: locale,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        title: 'Labor',
        home: const SplashScreen(),
      ),
    );
  }
}
