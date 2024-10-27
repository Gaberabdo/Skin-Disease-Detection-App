import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skin_disease_detection/routes/pageRoute.dart';
import 'package:skin_disease_detection/screens/AboutDiseases/aboutdiseases.dart';
import 'package:skin_disease_detection/screens/Aboutus/aboutcreaters.dart';
import 'package:skin_disease_detection/screens/DoandDont/Doees.dart';
import 'package:skin_disease_detection/screens/Introduction/intro.dart';
import 'package:skin_disease_detection/screens/MainScreen/mainScreen.dart';
import 'package:skin_disease_detection/screens/authentication/Screens/Login/login_screen.dart';
import 'constraints.dart';
import 'screens/Introduction/intro.dart';
import 'screens/DoandDont/Doees.dart';

late SharedPreferences prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.lightBlueAccent[400],
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: kPrimaryColor,
              foregroundColor: Colors.white,
              shape: const StadiumBorder(),
              maximumSize: const Size(double.infinity, 44),
              minimumSize: const Size(double.infinity, 44),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: kPrimaryLightColor,
            iconColor: kPrimaryColor,
            prefixIconColor: kPrimaryColor,
            contentPadding: EdgeInsets.all(0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide.none,
            ),
          )),
      home: prefs.getBool("intro") == true
          ? FirebaseAuth.instance.currentUser == null
              ? const LoginScreen()
              : const MainScreen()
          : const Intro(),
      routes: {
        PageRoutes.home: (context) => const MainScreen(),
        PageRoutes.dodont: (context) => const Dos(),
        PageRoutes.intro: (context) => const Intro(),
        PageRoutes.aboutdis: (context) => const AboutDisease(),
        PageRoutes.aboutus: (context) => const AboutUs(),
      },
    );
  }
}

/*
Important link : https://www.thirdrocktechkno.com/blog/how-to-implement-navigation-drawer-in-flutter/

*/
