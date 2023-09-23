import 'package:flutter/material.dart';
import 'intro_breathingtext.dart';


//Blank background for welcome
class IntroBreathingScreen extends StatefulWidget {
  final String firstName;
  const IntroBreathingScreen({required this.firstName, Key? key}) : super(key: key);

  @override 
   // ignore: library_private_types_in_public_api
  _IntroBreathingScreenState createState() => _IntroBreathingScreenState();
}

//Creates animation controller 
class _IntroBreathingScreenState extends State<IntroBreathingScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;


  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      //Total duration time
      duration: const Duration(milliseconds: 7000),
    );

    _animationController.forward();

    // Wait for the animation to complete and navigate to the home screen
    Future.delayed(
      const Duration(milliseconds: 8000), () {
        Navigator.pushReplacementNamed(context, '/countdown');
      }
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Stack(
            children: [

              //Backgroung image
              Positioned.fill(
                child: Image.asset(
                  'assets/img/Create_account.png',
                  fit: BoxFit.cover,
                ),
              ),

              //ANIMATION + TEXT
              Center(
                child: FadeTransition(
                  opacity: _animationController,
                  child: IntroBreathingText(firstName: widget.firstName),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}








