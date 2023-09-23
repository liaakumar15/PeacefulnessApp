// ignore: file_names

// ignore_for_file: unused_element

//This is the initial sign in screen users see when they first enter the app
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:peacefulness_app/services/auth_services.dart';


class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  //Text boxes for email and password input
  final emailInput = TextEditingController();
  final passwordInput = TextEditingController();

  //FUNCTION: Wrong email login attempt
  void wrongEmailMessage(context) {
    showDialog(
      context: context, 
      builder: (context) {
        return const AlertDialog(
          title: Text('Wrong email or password!'),
        );
      }
    );
  }

  //FUNCTION: Wrong password login attempt 
  void wrongPasswordMessage(context) {
    showDialog(
      context: context, 
      builder: (context) {
        return const AlertDialog(
          title: Center(
            child: Text(
              'Wrong email or password',
              style: TextStyle(
                fontFamily: 'Fragment_SansLight',
                color: Color.fromARGB(255, 254, 176, 67)
              ),
            ),
          ),
        );
      }
    );
  }

  //FUNCTION: Sign in fuction, calls Firebase Auth
  void signUserIn(context) async {
    showDialog(
      context: context,
      builder:(context) {
        return const Center(
          //Show loading cirlce
          child: CircularProgressIndicator(),
        );
      },
    );
    //TRY 
    try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailInput.text,
      password: passwordInput.text,
    );

    //Pop loading circle
    Navigator.pop(context);
    Navigator.pushReplacementNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      //Pop loading circle
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        //Displays 'incorrect login attempt' message
        wrongEmailMessage(context);
      } else if (e.code == 'wrong-password') {
      //Displays 'incorrect login attempt' message
      wrongPasswordMessage(context);
      }
    }
  }

  //FUNCTION: Google Sign in
  final authService = AuthService();
  void errorGmailSignIn(context) {
    showDialog(
      context: context, 
      builder: (context) {
        return const AlertDialog(
          title: Text('Error signing in with Google'),
        );
      }
    );
  }
  //End of Google Sign in

  //MAIN BODY
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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

          //HEADING: Sign In
          const Padding(
            padding: EdgeInsets.only(left: 31, top: 163),
            child: Text(
              'Sign In',
              style: TextStyle(
                fontSize: 60,
                fontFamily: 'Fragment',
                color: Colors.white,
              ),
            ),
          ), 

          //TEXT BOX: Email 
          Padding(
            padding: const EdgeInsets.only(left: 36, top: 252),
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

          //Spacing Box
          const SizedBox(height: 35),

          //TEXT BOX: Password
          Padding( 
            padding: const EdgeInsets.only(left: 36, top: 340),
            // ignore: sized_box_for_whitespace
            child: Container(
              width: 329, 
              child: TextFormField(
                //PASSWORD CONTROLLER
                controller: passwordInput,

                //STYLE of user input
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Fragment_SansLight',
                  color: Colors.white,
                ),

                //STYLE of hint text
                decoration: InputDecoration(
                hintText: 'Password',
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

          //TEXT BUTTON: Forgot Password 
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 385),
            child: Stack (
              children: [
                TextButton(
                  //FUNCTION goes to forgot password screen
                  onPressed: () {
                    // Handle navigation to the forgot password page
                    Navigator.pushReplacementNamed(context, '/forgot-password');
                  },

                  //TEXT
                  child: const Text(
                    'Forgot password?',
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
        
          //Box for spacing
          const SizedBox(height: 60),

          //BUTTON: Sign in 
          Center(
            child: Padding (
              padding: const EdgeInsets.only(top: 490),
              child: TextButton(
                //FUNCTION calls sign in 
                onPressed: () {
                  signUserIn(context);
                }, 
                
                //STYLE of button
                style: TextButton.styleFrom(
                  fixedSize: const Size(329, 48),
                  //Setting border radius of text box
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  backgroundColor: const Color.fromARGB(255, 254, 176, 67), // Change the color here
                ),

                //STYLE of text
                child: const Text(
                  'Sign In',
                  //style of sign in font
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Fragment_SansLight',
                    color: Colors.white,
                  )
                ),
              ),
            ),
          ),

          //BUTTON: Dont have an account 
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 535),
            child: TextButton(
              //FUNCTION: Directs to create account page
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/create-account');
              }, 

              //STYLE of text     
              child: const Text(
                "Don't have an account?                  Create one.",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Fragment_SansLight',
                  color: Colors.white,
                ),
              ),
            ),
          ),

          //BUTTON: Sign in with google
          Padding(
            padding: const EdgeInsets.only(left: 31, top: 720),
            child: TextButton(
              //FUNCTION navigates to home
              onPressed: () {
                authService.signInWithGoogle().then(
                  (userCredential) {
                    // Handle the successful sign-in with Google here
                    Navigator.pushReplacementNamed(context, '/home');
                  }
                ) 
                .catchError(
                  (error) {
                    // Handle any errors that occur during the sign-in process
                    errorGmailSignIn(context);
                  }
                ); 
              },

              //STYLE of the button
              style: TextButton.styleFrom(
                fixedSize: const Size(332, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: const Color.fromARGB(255, 254, 176, 67),
                padding: EdgeInsets.zero,
              ),
            
              //TEXT
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end, // Center the row horizontally
                  children: [
                    //STYLE
                    const Padding(
                      padding: EdgeInsets.only(left: 75),
                      child: Text(
                        'Sign in with ',
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Fragment_SansLight',
                          color: Colors.white,
                        ),
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    
                    //GOOGLE LOGO
                    Padding(
                      padding: const EdgeInsets.only(right: 86),
                      child: Image.asset(
                        'assets/img/google_logo.png',
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ],
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
