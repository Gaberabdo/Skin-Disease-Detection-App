import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:skin_disease_detection/app_router/App_Router.dart';
import 'package:skin_disease_detection/custom_shape.dart';
import 'package:skin_disease_detection/diseases/diseases.dart';
import 'package:skin_disease_detection/doctor/doctor_home.dart';
import 'package:skin_disease_detection/history/history.dart';
import 'package:skin_disease_detection/modules/login_screen/login_screen.dart';
import 'package:skin_disease_detection/skin_test/1-test_home_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          appBar: AppBar(
            toolbarHeight: 180,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            flexibleSpace: ClipPath(
              clipper: Customshape(),
              child: Container(
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 13, 113, 150),
                          Color.fromARGB(255, 87, 179, 212),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(30.0)),
                  padding: const EdgeInsets.only(top: 70),
                  alignment: Alignment.topCenter,
                  height: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.width,
                  // color: Color.fromARGB(255, 16, 170, 226),
                  child: const Column(
                    children: [
                      Text(
                        "Achelois",
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Moon goddess who washes away pain",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      )
                    ],
                  )),
            ),
          ),
          body: Container(
            margin: const EdgeInsets.all(20),
            child: Center(
              child: ListView(children: [
                Container(
                  height: 56.0,
                  width: 330,
                  margin: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Test_Home_page()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      fixedSize: const Size(330, 100),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0)),
                      padding: const EdgeInsets.all(0.0),
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 16, 170, 226),
                              Color.fromARGB(255, 87, 179, 212),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Container(
                          constraints: const BoxConstraints(
                              maxWidth: 350.0, minHeight: 50.0),
                          alignment: Alignment.center,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 60),
                              Icon(Icons.text_snippet_outlined),
                              SizedBox(width: 10),
                              Text(
                                "Make test",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ],
                          )),
                    ),
                  ),
                ),
                Container(
                  height: 56.0,
                  width: 330,
                  margin: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyApp(
                                  appRouter: AppRouter(),
                                )),
                      );

                      // AwesomeDialog(
                      //   context: context,
                      //   dialogType: DialogType.INFO,
                      //   animType: AnimType.BOTTOMSLIDE,
                      //   title: 'Coming soon',
                      //   desc: 'Our developing team are working on this right now',
                      //   btnCancelOnPress: () {},
                      //   btnOkOnPress: ()  {},
                      //    )..show();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      fixedSize: const Size(330, 100),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0)),
                      padding: const EdgeInsets.all(0.0),
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 16, 170, 226),
                              Color.fromARGB(255, 87, 179, 212),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Container(
                          constraints: const BoxConstraints(
                              maxWidth: 350.0, minHeight: 50.0),
                          alignment: Alignment.center,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 60),
                              Icon(Icons.local_hospital_rounded),
                              SizedBox(width: 10),
                              Text(
                                "Find doctor",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ],
                          )),
                    ),
                  ),
                ),
                Container(
                  height: 56.0,
                  width: 330,
                  margin: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Diseases()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      fixedSize: const Size(330, 100),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0)),
                      padding: const EdgeInsets.all(0.0),
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 16, 170, 226),
                              Color.fromARGB(255, 87, 179, 212),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Container(
                          constraints: const BoxConstraints(
                              maxWidth: 350.0, minHeight: 50.0),
                          alignment: Alignment.center,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 60),
                              Icon(Icons.health_and_safety_sharp),
                              SizedBox(width: 10),
                              Text(
                                "Diseases",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ],
                          )),
                    ),
                  ),
                ),
                Container(
                  height: 56.0,
                  width: 330,
                  margin: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const History()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      fixedSize: const Size(330, 100),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0)),
                      padding: const EdgeInsets.all(0.0),
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 16, 170, 226),
                              Color.fromARGB(255, 87, 179, 212),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Container(
                          constraints: const BoxConstraints(
                              maxWidth: 350.0, minHeight: 50.0),
                          alignment: Alignment.center,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 60),
                              Icon(Icons.format_list_numbered_rounded),
                              SizedBox(width: 10),
                              Text(
                                "History",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ],
                          )),
                    ),
                  ),
                ),
                Container(
                  height: 56.0,
                  width: 330,
                  margin: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      fixedSize: const Size(330, 100),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0)),
                      padding: const EdgeInsets.all(0.0),
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 16, 170, 226),
                              Color.fromARGB(255, 87, 179, 212),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Container(
                          constraints: const BoxConstraints(
                              maxWidth: 350.0, minHeight: 50.0),
                          alignment: Alignment.center,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 60),
                              Icon(Icons.logout_sharp),
                              SizedBox(width: 10),
                              Text(
                                "Logout",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ],
                          )),
                    ),
                  ),
                ),
              ]),
            ),
          )),
    );
  }
}
