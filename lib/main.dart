import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:skin_disease_detection/modules/login_screen/login_screen.dart';
import 'package:skin_disease_detection/shared/bloc_observer/bloc_observer.dart';
import 'package:skin_disease_detection/splash_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  // FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Achelois',
      debugShowCheckedModeBanner: false,      
      theme: ThemeData.light(),
      home: LoginScreen(),
    );

  }

}

