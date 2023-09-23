import 'package:flutter/material.dart';

class CheckInScoreText extends StatefulWidget {
    final double averageScore;
  const CheckInScoreText ({required this.averageScore, Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CheckInScoreTextState createState() => _CheckInScoreTextState();
}

class _CheckInScoreTextState extends State<CheckInScoreText> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  //late Animation<double> _circleAnimation;
  late Animation<double> _averageScoreAnimation;

  //Animation controller
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );

     /*_circleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 1.0), // Animates from 0.0 to 0.3
      ),
    );*/

    _averageScoreAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 1.0), // Animates from 0.0 to 0.3
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
          
          //Circle
          //Circle
AnimatedBuilder(
  animation: _animationController,
  builder: (BuildContext context, Widget? child) {
    return Opacity(
      opacity: _averageScoreAnimation.value,
      child: Padding(
        padding: const EdgeInsets.only(top: 300), // Center the circle within the container
        child: Container(
          width: 155, // You can adjust this size to fit your needs
          height: 155, // You can adjust this size to fit your needs
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromRGBO(253, 177, 55, 1), // You can set the desired background color for the circle
          ),
          alignment: Alignment.center,
          child: Text(
            "${widget.averageScore}!",
            //STYLE
            style: const TextStyle(
              fontSize: 100, 
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





