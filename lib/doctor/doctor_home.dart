import 'package:flutter/material.dart';
import 'package:skin_disease_detection/app_router/App_Router.dart';
import 'package:skin_disease_detection/shared/constants/constants.dart';

class MyApp extends StatelessWidget
{
  final AppRouter appRouter;


  const MyApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      onGenerateRoute: appRouter.generateRoute,
      initialRoute: mapScreen,
      // home: Home()
    );
  }
}
