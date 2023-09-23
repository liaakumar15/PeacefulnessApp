import 'package:flutter/material.dart';
import 'welcome_text.dart';


//Blank background for welcome
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override 
  // ignore: library_private_types_in_public_api
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

//Creates animation controller 
class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;


  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      //Total duration time
      duration: const Duration(milliseconds: 4000),
    );

    _animationController.forward();

    // Wait for the animation to complete and navigate to the Sign In screen
    Future.delayed(const Duration(milliseconds: 9000), () {
      Navigator.pushReplacementNamed(context, '/sign-in');
    }
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  //MAIN BODY
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Stack(
            children: [

              //Background image
              Positioned.fill(
                child: Image.asset(
                  'assets/img/Welcome1.png',
                  fit: BoxFit.cover,
                ),
              ),
              
              //ANIMATION + TEXT
              Center(
                child: FadeTransition(
                  opacity: _animationController,
                  child: const WelcomeText(),
                ),
              ),
              
            ],
          ),
        ],
      ),
    );
  }
  }








