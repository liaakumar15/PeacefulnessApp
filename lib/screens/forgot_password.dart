import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen ({super.key});

//TEXT BOX: Email input
final emailInput = TextEditingController();

//FUNCTION: Password reset
Future passwordReset(context) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: emailInput.text);
    Navigator.pushReplacementNamed(context, '/sent-email');
  } on FirebaseAuthException catch (e) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(e.message.toString()),
        );
      },
    );
  }
}

//MAIN BODY
@override
Widget build(BuildContext context) {
  return Scaffold(
    body: SingleChildScrollView (
      child: Stack(
        children: [
        
          //Background image
          Align(
            alignment: Alignment.center,
            key: UniqueKey(),
            child: Image.asset(
              'assets/img/Create_account.png',
              fit: BoxFit.cover,
            ),
          ),
    
          //HEADING: Forgot password 
          const Padding(
            padding: EdgeInsets.only(left: 31, top: 160),
            //STYLE
            child: Text(
              'Forgot Password?',
              style: TextStyle(
                fontSize: 55,
                fontFamily: 'Fragment',
                color: Colors.white,
              ),
            ),
          ),

          //SUB HEADING: It happens to the best of us 
          const Padding(
            padding: EdgeInsets.only(left: 32, top: 280),
            child: Text(
              "Don't worry, it happens to the best of us.",
              style: TextStyle (
                fontSize: 15,
                fontFamily: 'Fragment_SansLight',
                color: Colors.white,
              ),
            ),
          ),

          //TEXT BOX: Email input
          Padding(
            padding: const EdgeInsets.only(left: 36, top: 320),
            // ignore: sized_box_for_whitespace
            child: Container(
              width: 329, 
              child: TextFormField(
                //EMAIL CONTROLLER
                controller: emailInput,
                
                //STYLE of user input text
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Fragment_SansLight',
                  color: Colors.white,
                ),
                
                //STYLE of hint text
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Fragment_SansLight',
                    color: Colors.white.withOpacity(1.0),
                  ),

                  //STYLE of border
                  border: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),

                  contentPadding: const EdgeInsets.only(bottom: 4), // Adjust the length of the underline
                  helperStyle: const TextStyle(height: 0.8),
                ),
              ),
            ),
          ),

          //BUTTON: Submit 
          Padding(
            padding: const EdgeInsets.only(left: 31, top: 450),
            child: TextButton(
              //FUNCTION: Calls sign in
              onPressed: () {
                passwordReset(context);
              }, 
              
              //STYLE of text button
              style: TextButton.styleFrom(
                fixedSize: const Size(329, 48),
                //BORDER RADIUS of text box
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                backgroundColor: const Color.fromARGB(255, 254, 176, 67), // Change the color here
              ),

              //TEXT: Submit
              child: const Text(
                'Submit',
                //style of sign in font
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Fragment_SansLight',
                  color: Colors.white,
                )
              ),
            ),
          ),

          //TEXT BUTTON: Take me back to sign in
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 740), // Add vertical spacing here to move the button down
              child: Align(
                alignment: Alignment.bottomCenter, // Center the button horizontally and move it to the bottom
                child: TextButton(
                  //FUNCTION: Goes to sign in page
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/sign-in');
                  }, 
                  
                  //TEXT
                  child: const Text(
                    "Take me back to sign in.",
                    //STYLE
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Fragment_SansLight',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
}