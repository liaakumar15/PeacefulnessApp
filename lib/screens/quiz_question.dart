import 'package:flutter/material.dart';
import 'circular_number.dart';


class QuizQuestion extends StatelessWidget {
  final String question;
  final String lowValue;
  final String highValue;

  // ignore: use_key_in_widget_constructors
  const QuizQuestion({
    required this.question,
    required this.lowValue,
    required this.highValue,
    
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 10),
          child: Text(
            question,
            style: const TextStyle(
              fontSize: 20,
              fontFamily: 'Fragment_SansLight',
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //TEXT
              Text(
                lowValue,
                //STYLE
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Fragment_SansLight',
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              //TEXT
              Text(
                highValue,
                //STYLE
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Fragment_SansLight',
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),

        //ROW: Question choices
            Padding(
            padding: const EdgeInsets.only(left: 10, top: 7, right: 10, bottom: 40),
            child: Row (
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
              CircularNumberButton(
                number: 1,
                onPressed: (value) {
                  // Handle the button press here
                  // You can store the selected value or perform any other action
                  //print('Button 1 pressed. Selected value: $value');
                },
              ),

              CircularNumberButton(
                number: 2,
                onPressed: (value) {
                  // Handle the button press here
                  // You can store the selected value or perform any other action
                  //print('Button 1 pressed. Selected value: $value');
                },
              ),

              CircularNumberButton(
                number: 3,
                onPressed: (value) {
                  // Handle the button press here
                  // You can store the selected value or perform any other action
                  //print('Button 1 pressed. Selected value: $value');
                },
              ),

              CircularNumberButton(
                number: 4,
                onPressed: (value) {
                  // Handle the button press here
                  // You can store the selected value or perform any other action
                  //print('Button 1 pressed. Selected value: $value');
                },
              ),
          
      ],
            ),
            ),
      ],
    );
  }
}
