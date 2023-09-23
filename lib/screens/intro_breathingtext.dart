import 'package:flutter/material.dart';

class IntroBreathingText extends StatefulWidget {
  final String firstName;
  const IntroBreathingText({required this.firstName, Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _IntroBreathingTextState createState() => _IntroBreathingTextState();
}

class _IntroBreathingTextState extends State<IntroBreathingText> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _welcomeUserAnimation;
  late Animation<double> _creatingAccountAnimation;
  late Animation<double> _meantimeAnimation;

  //Animation controller
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    );

    _welcomeUserAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.3), // Animates from 0.0 to 0.3
      ),
    );

    _creatingAccountAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.35, 0.6), // Animates from 0.3 to 0.6
      ),
    );

    _meantimeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.65, 1.0), // Animates from 0.6 to 1.0
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  //Centers all text
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [

          //TEXT: Welcome + User's name 
          AnimatedBuilder(
            animation: _animationController,
            builder: (BuildContext context, Widget? child) {
              return Opacity(
                opacity: _welcomeUserAnimation.value,
                child: Padding(
                  padding: const EdgeInsets.only(top: 300), // Center the text within the container
                  child: Text(
                    "Hi, ${widget.firstName}!",
                    //STYLE
                    style: const TextStyle(
                      fontSize: 55, 
                      fontFamily: 'Fragment', 
                      color: Colors.white
                    ),
                    //CENTER ALIGN
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }
          ),

          //TEXT: We're creating your account right now 
          AnimatedBuilder(
            animation: _animationController,
            builder: (BuildContext context, Widget? child) {
              return Opacity(
                opacity: _creatingAccountAnimation.value,
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 70),
                    child: Text(
                      "We're creating your account right now",
                      //STYLE
                      style: TextStyle(
                        fontSize: 30, 
                        fontFamily: 'Fragment', 
                        color: Colors.white
                      ),
                      //CENTER ALIGN
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            },
          ),

          //TEXT: In the meantime 
          AnimatedBuilder(
            animation: _animationController,
            builder: (BuildContext context, Widget? child) {
              return Opacity(
                opacity: _meantimeAnimation.value,
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 60),
                    child: Text(
                      "In the meantime, why don't we take a moment to pause?",
                      //STYLE
                      style: TextStyle(
                        fontSize: 25, 
                        fontFamily: 'Fragment', 
                        color: Colors.white
                      ),
                      //CENTER ALIGN
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      );
  }
}





