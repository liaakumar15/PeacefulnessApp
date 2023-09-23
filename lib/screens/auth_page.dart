import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:peacefulness_app/screens/home_screen.dart';
import 'package:peacefulness_app/screens/signin_screen.dart';

class AuthPage extends StatelessWidget {
  final String firstName;
  const AuthPage({required this.firstName, Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: StreamBuilder<User?>(
      //Calls for firebase auth
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        //User successfully logs in
        if (snapshot.hasData) {
          return const HomeScreen(); //TEMPORARY
          //return HomeScreen(firstName: ModalRoute.of(context)!.settings.arguments as String);
        }

        //User has NOT logged in
        else {
          return SignInScreen();
        }
      }
    )
  );  
}
}