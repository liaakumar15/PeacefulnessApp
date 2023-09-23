import 'package:flutter/material.dart';

class WelcomeText extends StatefulWidget {
  const WelcomeText({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WelcomeTextState createState() => _WelcomeTextState();
}

class _WelcomeTextState extends State<WelcomeText> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _welcomeAnimation;
  late Animation<double> _thisIsAnimation;
  late Animation<double> _peacefulnessAnimation;
  late Animation<double> _pfnLogoAnimation;

@override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3500),
    );

    _welcomeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.3), // Animates from 0.0 to 0.3
      ),
    );

  _thisIsAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.3, 0.6), // Animates from 0.3 to 0.6
      ),
    );

    _peacefulnessAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.3, 0.6), // Animates from 0.6 to 1.0
      ),
    );

    _pfnLogoAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.5, 1.0), // Animates from 0.6 to 1.0
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      
        //Box for spacing
        const SizedBox(height: 340),

        //TEXT: Welcome 
        AnimatedBuilder(
          animation: _animationController,
          builder: (BuildContext context, Widget? child) {
            return Opacity(
              opacity: _welcomeAnimation.value,
              child: const Center(
                child: Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 60, 
                    fontFamily: 'Fragment', 
                    color: Colors.white
                  ),
                ),
              ),
            );
          },
        ),

        // Add spacing between the texts
        const SizedBox(height: 170),
        
        //TEXT: This is
        AnimatedBuilder(
          animation: _animationController,
          builder: (BuildContext context, Widget? child) {
            return Opacity(
              opacity: _thisIsAnimation.value,
              child: const Center(
                child: Text(
                  'This is',
                  style: TextStyle(
                    fontSize: 40, 
                    fontFamily: 'Fragment', 
                    color: Colors.white
                  ),
                ),
              ),
            );
          },
        ),

        //TEXT: Peacefulness 
        AnimatedBuilder(
          animation: _animationController,
          builder: (BuildContext context, Widget? child) {
            return Opacity(
              opacity: _peacefulnessAnimation.value,
              child: const Center(
                child: Text(
                  'Peacefulness',
                  style: TextStyle(
                    fontSize: 40, 
                    fontFamily: 'Fragment', 
                    color: Colors.white
                  ),
                ),
              ),
            );
          },
        ),

        //Spacing Box
        const SizedBox(height: 15),

        //Peacefulness logo
        AnimatedBuilder(
          animation: _animationController,
          builder: (BuildContext context, Widget? child) {
            return Opacity(
              opacity: _pfnLogoAnimation.value,
              child: Center(
                child: Image.asset('assets/img/PFN_Symbol.png')
              ),
            );
          },
        ),
      ],
    );
  }
}





