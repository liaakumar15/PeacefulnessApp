import 'package:flutter/material.dart';

class CountdownText extends StatefulWidget {
  const CountdownText({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CountdownTextState createState() => _CountdownTextState();
}

class _CountdownTextState extends State<CountdownText> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _tenSecondsAnimation;
  late Animation<double> _deepBreathAnimation;
  late Animation<double> _beginAnimation;


@override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500),
    );

    _tenSecondsAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.3), // Animates from 0.0 to 0.5
      ),
    );

  _deepBreathAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.31, 0.6), // Animates from 0.5 to 1.0
      ),
    );

    _beginAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.61, 0.9), // Animates from 0.5 to 1.0
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  //MAIN BODY
  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
      
        //TEXT: For the next twenty seconds 
        AnimatedBuilder(
          animation: _animationController,
          builder: (BuildContext context, Widget? child) {
            return Opacity(
              opacity: _tenSecondsAnimation.value,
              child: const Padding(
        padding: EdgeInsets.only(top: 150),
              child: Center(
                child: Text(
                  'For the next 20 seconds, focus on your breath',
                  style: TextStyle(
                    fontSize: 30, 
                    fontFamily: 'Fragment', 
                    color: Colors.white
                  ),
                  textAlign: TextAlign.center,
                ),
                ),
              ),
              );
          },
              ),

        // Add spacing between the texts
        const SizedBox(height: 30),
        
        //TEXT: Breathe in, breathe deep, breathe out
        AnimatedBuilder(
          animation: _animationController,
          builder: (BuildContext context, Widget? child) {
            return Opacity(
              opacity: _deepBreathAnimation.value,
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20), 
                  child: Text(
                    'Breathe In. Breathe Deep. Breathe Out.',
                    style: TextStyle(
                      fontSize: 30, 
                      fontFamily: 'Fragment', 
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          },
        ),

        // Add spacing between the texts
        const SizedBox(height: 30),

        //TEXT: Let's begin
        AnimatedBuilder(
          animation: _animationController,
          builder: (BuildContext context, Widget? child) {
            return Opacity(
              opacity: _beginAnimation.value,
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20), 
                  child: Text(
                    "Let's Begin.",
                    style: TextStyle(
                      fontSize: 30, 
                      fontFamily: 'Fragment', 
                      color: Colors.white,
                    ),
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





