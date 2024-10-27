import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_disease_detection/screens/authentication/auth_class.dart';

import '../routes/pageRoute.dart';
import '../screens/authentication/Screens/Login/login_screen.dart';

class NavigatorDrawer extends StatelessWidget {
  const NavigatorDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 80,
            child: DrawerHeader(
              child: Text(
                'Skin Disease Detection',
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ),
          ),
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/skindisease.jpg'),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Text(FirebaseAuth.instance.currentUser!.email ?? ''),
          ),
          DrawerItem(
            icon: Icons.home,
            text: 'Home',
            onTap: () =>
                Navigator.pushReplacementNamed(context, PageRoutes.home),
          ),
          DrawerItem(
            icon: Icons.rule,
            text: 'Do\'s and Don\'ts',
            onTap: () =>
                Navigator.pushReplacementNamed(context, PageRoutes.dodont),
          ),
          DrawerItem(
            icon: Icons.assignment_sharp,
            text: 'About Diseases',
            onTap: () =>
                Navigator.pushReplacementNamed(context, PageRoutes.aboutdis),
          ),
          DrawerItem(
            icon: Icons.assignment_ind_outlined,
            text: 'About Us',
            onTap: () =>
                Navigator.pushReplacementNamed(context, PageRoutes.aboutus),
          ),
          DrawerItem(
            icon: Icons.logout,
            text: 'logout',
            onTap: () {
              Authentication.signOut(context: context);
              Get.offAll(() => const LoginScreen());
            },
          )
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget DrawerItem({
    //Function to show the item in the drawer
    IconData? icon,
    String? text,
    GestureTapCallback? onTap,
  }) {
    return ListTile(
      title: Row(children: [
        Icon(icon),
        Padding(
          padding: const EdgeInsets.only(left: 3),
          child: Text(text!),
        ),
      ]),
      onTap: onTap,
    );
  }
}

class CreateDrawerHeader extends StatelessWidget {
  //class for the header of the
  const CreateDrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          color: Colors.purple,
          image: DecorationImage(
            image: AssetImage("assets/images/skindisease.jpg"),
            fit: BoxFit.cover,
          )),
      child: Stack(children: [
        Positioned(
            bottom: 15,
            left: 18,
            child: Text(
              "Skin Disease Detection",
              style: TextStyle(
                  color: Color.fromARGB(255, 191, 21, 214),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
      ]),
    );
  }
}
