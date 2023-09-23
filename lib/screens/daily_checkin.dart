import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'circular_number.dart';
import 'quiz_question.dart';
import 'checkin_score.dart';

class DailyCheckScreen extends StatefulWidget {
  const DailyCheckScreen ({super.key});

  @override
  State<DailyCheckScreen> createState() => _DailyCheckScreenState();
}

void showErrorMessage(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (context) {
      return const AlertDialog(
        title: Center(
          child: Text(
            "Please make sure you've answered each question exactly once",
            style: TextStyle(
              fontFamily: 'Fragment_SansLight',
              color: Color.fromARGB(255, 254, 176, 67),
            ),
          ),
        ),
      );
    },
  );
}

double extractAverageScore(Map<int, int?> userSelections, List<QuizQuestion> quizQuestions, BuildContext context) {
  int totalScore = 0;
  int totalQuestions = quizQuestions.length;

  userSelections.forEach((questionNumber, selectedValue) {
    if (selectedValue != null) {
      totalScore += selectedValue;
    } else {
      showErrorMessage(context, "Please make sure you've answered each question exactly once.");
    }
  });

  double averageScore= totalScore / totalQuestions;
  return averageScore;
}

class _DailyCheckScreenState extends State<DailyCheckScreen> {
  Map<int, int?> userSelections = {};


  List<QuizQuestion> quizQuestions = [
   const QuizQuestion(
    question: 'I am feeling',
    lowValue: 'Restless',
    highValue: 'Peaceful',
  ), 
  const QuizQuestion(
    question: 'I am feeling',
    lowValue: 'Discontent',
    highValue: 'Content',
  ),
  const QuizQuestion(
    question: 'I am feeling',
    lowValue: 'Resentful',
    highValue: 'Hopeful',
  ),
  const QuizQuestion(
    question: 'My heart feels',
    lowValue: 'Closed',
    highValue: 'Open',
  ),
  const QuizQuestion(
    question: 'My mind feels',
    lowValue: 'Closed',
    highValue: 'Open',
  ), 
];

  @override
  Widget build(BuildContext context) {
    double averageScore = extractAverageScore(userSelections, quizQuestions, context);
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
Expanded( 
  child: ListView.builder(
    itemCount: quizQuestions.length + 1, 
    itemBuilder: (context, index) {
      // Check if the current index is equal to the length of quizQuestions,
      // which means it's the position for the submit button.
      if (index == quizQuestions.length) {
        return Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheckInScoreScreen(averageScore: averageScore),
                      ),
                    );
   
  },
                style: TextButton.styleFrom(
                  fixedSize: const Size(330, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  backgroundColor: const Color.fromARGB(255, 254, 176, 67),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Fragment_SansLight',
                    color: Colors.white,
                  )
                ),
              ),
            ],
          ),
        );
      } else {
        // For other indices, show the quiz questions as usual
        return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [quizQuestions[index]],
            ),
          );
      }
    },
  ),
),         
        ],
      ),
      ),
      ),
              );
}
}
