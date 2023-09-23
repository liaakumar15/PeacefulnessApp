import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:peacefulness_app/screens/checkin_scoretext.dart';
//import 'daily_checkin.dart';

//Blank background for welcome
class CheckInScoreScreen extends StatefulWidget {
  final double averageScore;
  const CheckInScoreScreen({required this.averageScore, Key? key}) : super(key: key);

  @override 
   // ignore: library_private_types_in_public_api
  _CheckInScoreScreenState createState() => _CheckInScoreScreenState();
}

//Creates animation controller 
class _CheckInScoreScreenState extends State<CheckInScoreScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;


  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      //Total duration time
      duration: const Duration(milliseconds: 3000),
    );

    _animationController.forward();

  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

@override
  Widget build(BuildContext context) {
    final currentDate = DateTime.now();
    final formattedDate = DateFormat('MMMM d, y').format(currentDate);

     return GestureDetector(
      // Listen for a vertical swipe gesture
      onVerticalDragUpdate: (details) {
        // Check if the swipe is downwards and exceeds a certain threshold
        if (details.primaryDelta! > 50) {
          Navigator.pop(context); // Dismiss the modal bottom sheet
        }
      },
      child: ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
      color: const Color.fromRGBO(214, 108, 19, 1),
      height: MediaQuery.of(context).size.height * 0.9, // Adjust the height as needed

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          //TOP ROW for Cancel, Daily Date
          Padding(
            padding: const EdgeInsets.only(left: 13, top: 5),
            child: Row (
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
                
                //TEXT BUTTON: Cancel
                TextButton(
                  //FUNCTION goes to home screen
                  onPressed: () {
                    // Handle navigation to the home screen
                  },

                  //TEXT
                  child: const Text(
                    'Cancel',
                    //STYLE of forgot password text
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Fragment_SansLight',
                      color: Colors.white,
                    ),
                  ),
                ),

                  //TEXT BUTTON: Current Daily Date
                  Padding(
                    padding: const EdgeInsets.only(right: 13, top: 0),
                    child: Text(
                      formattedDate,
                      style: const TextStyle(
                        fontSize: 15,
                        fontFamily: 'Fragment_SansLight',
                        color: Colors.white,
                      ),
                    ),
                  ), 
                ],
              ),
            ),

            //HEADING: Wellness Check In
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 5),
              child: Text(
                'Wellness Check-In ',
                //STYLE
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'Fragment',
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              )
            ),
          //ANIMATION + TEXT
              Center(
                child: FadeTransition(
                  opacity: _animationController,
                  child: CheckInScoreText(averageScore: widget.averageScore),
                ),
              ),

        ],
      ),
      ),
      ),
              );
}
}

