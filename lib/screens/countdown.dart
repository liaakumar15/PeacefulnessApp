import 'package:flutter/material.dart';
import 'countdown_text.dart';
import 'package:timer_count_down/timer_count_down.dart';

//import 'package:firebase_auth/firebase_auth.dart';

//Blank background for welcome
class CountdownScreen extends StatefulWidget {
  const CountdownScreen ({Key? key}) : super(key: key);

  @override 
  // ignore: library_private_types_in_public_api
  _CountdownScreenState createState() => _CountdownScreenState();
}

//Creates animation controller 
class _CountdownScreenState extends State<CountdownScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _animationComplete = false;


  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      //Total duration time
      duration: const Duration(milliseconds: 12000),
    );

    _animationController.forward().then((value) {
      setState(() {
        _animationComplete = true; // Animation is complete, update the flag
      });
    });
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
                  'assets/img/Create_account.png',
                  fit: BoxFit.cover,
                ),
              ),
              
              //TEXT BUTTON: Skip
              Padding(
                padding: const EdgeInsets.only(left: 300, top: 50),
                child: Stack (
                  children: [
                    TextButton(
                      //FUNCTION goes to forgot password screen
                      onPressed: () {
                        // Handle navigation to the forgot password page
                        Navigator.pushReplacementNamed(context, '/home');
                      },

                      //TEXT
                      child: const Text(
                        'Skip >>>',
                        //STYLE of forgot password text
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Fragment_SansLight',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //ANIMATION + TEXT
              Center(
                child: FadeTransition(
                  opacity: _animationController,
                  child: const CountdownText(),
                ),
              ),

              //COUNTDOWN TIMER
              Padding(
                padding: const EdgeInsets.only(top: 350), 
                child: Center(
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (BuildContext context, Widget? child) {
                    if (_animationComplete) {
                      return Countdown(
                        seconds: 20,
                        build: (BuildContext context, double time) => Text(
                          time.ceil().toString(),
                          style: const TextStyle(
                            fontSize: 200,
                            fontFamily: 'Fragment',
                            color: Colors.white,
                          ),
                        ),
                        interval: const Duration(seconds: 1),
                        onFinished: () {
                          // Countdown finished, navigate to the home screen
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                      );
                    } else {
                      // If animation is not complete, show an empty container
                      return Container();
                    }
                  },
                )
                ),
              ),
              
            ],
          ),
        ],
      ),
    );
  }
  }
