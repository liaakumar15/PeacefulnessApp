import 'package:flutter/material.dart';
import 'package:peacefulness_app/screens/SignIn_screen.dart';
import 'package:peacefulness_app/screens/checkin_score.dart';
import 'package:peacefulness_app/screens/sent_email.dart';
//import 'package:peacefulness_app/screens/auth_page.dart';
import 'package:peacefulness_app/screens/welcome_screen.dart';
import 'package:peacefulness_app/screens/home_screen.dart';
import 'package:peacefulness_app/screens/forgot_password.dart';
import 'package:peacefulness_app/screens/create_account.dart';
import 'package:peacefulness_app/screens/intro_breathing.dart';
import 'package:peacefulness_app/screens/countdown.dart';
import 'package:peacefulness_app/screens/daily_checkin.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: const AuthPage(),
      title: 'PFN App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/welcome': (context) => const WelcomeScreen(),
        '/sign-in':(context) => SignInScreen(),
        '/home':(context) => const HomeScreen(),
        //'/home':(context) => HomeScreen(firstName: ModalRoute.of(context)?.settings.arguments as String? ?? "Friend"),
        '/forgot-password':(context)  => ForgotPasswordScreen(),
        '/create-account':(context)  => CreateAccountScreen(),
        '/sent-email':(context)  => const SentEmailScreen(),
        '/intro-breathing':(context)  => IntroBreathingScreen(firstName: ModalRoute.of(context)?.settings.arguments as String? ?? "Friend"),
        '/countdown':(context) => const CountdownScreen(),
        '/daily-check' :(context) => const DailyCheckScreen(),
        '/checkin-score' :(context) => CheckInScoreScreen(averageScore: ModalRoute.of(context)?.settings.arguments as double? ?? 0.0),
      } 
    );
  }
}
