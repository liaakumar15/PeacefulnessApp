import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:peacefulness_app/screens/intro_breathing.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:peacefulness_app/services/auth_services.dart';
//import 'intro_breathingtext.dart';

class CreateAccountScreen extends StatelessWidget {
  CreateAccountScreen ({super.key});

  //Text boxes for email and password input
  final emailInput = TextEditingController();
  final passwordInput = TextEditingController();
  final nameInput = TextEditingController();

  //FUNCTION: Extracts the first name from the full name
  String extractFirstName() {
    String fullName = nameInput.text.trim();
    int firstSpaceIndex = fullName.indexOf(' ');
    if (firstSpaceIndex != -1) {
      return fullName.substring(0, firstSpaceIndex);
    } else {
      // If there is no space, consider the whole input as the first name
      return fullName; 
    }
  }

  //MESSAGE: Wrong email 
  void wrongEmailMessage(context) {
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

  ////MESSAGE: Wrong password 
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

  //FUNCTION: Sign Up New User, calls Firebase Auth
  void signUserUp(context) async {
    bool isGoogleSignIn = await authService.isGoogleSignIn();

  try {
    if (!isGoogleSignIn) {
      // For manual sign-up, use the extracted first name
      String firstName = extractFirstName();

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailInput.text,
        password: passwordInput.text,
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => IntroBreathingScreen(firstName: firstName),
        ),
      );
      } else {
      // For Google sign-up, get the user's name from Google auth
      final user = FirebaseAuth.instance.currentUser;
      String? firstName = user?.displayName?.split(' ')[0] ?? "User"; // Assuming the user's name is provided by Google in the "displayName" field

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => IntroBreathingScreen(firstName: firstName),
        ),
      );
    }
    //try creating the user
    /*try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailInput.text,
        password: passwordInput.text,
      );

      //extracts user's first name
      String firstName = extractFirstName();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => IntroBreathingScreen(firstName: firstName),
          // Pass the firstName parameter here
        ),
      );*/
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
    
            //Column for the text
            Positioned.fill(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  //TEXT: 'Create an' 
                  const Padding(
                    padding: EdgeInsets.only(left: 31, top: 115),
                    child: Text(
                      'Create an',
                      style: TextStyle(
                        fontSize: 55,
                        fontFamily: 'Fragment',
                        color: Colors.white,
                      ),
                    ),
                  ),
    
                //TEXT: 'Account.' 
                const Padding(
                  padding: EdgeInsets.only(left: 31, top: 10),
                  child: Text(
                    'Account.',
                    style: TextStyle(
                      fontSize: 55,
                      fontFamily: 'Fragment',
                      color: Colors.white,
                    ),
                  ),
                ),
    
                //TEXTBOX: Name input 
                Padding(
                  padding: const EdgeInsets.only(left: 36, top: 30),
                  // ignore: sized_box_for_whitespace
                  child: Container(
                    width: 329,
                    child: TextFormField(
                      //TEXT CONTROLLER
                      controller: nameInput,

                      //STYLE of user input text
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Fragment_SansLight',
                        color: Colors.white,
                      ),

                      //STYLE of hint text
                      decoration: InputDecoration(
                        hintText: 'Name',
                        hintStyle: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Fragment_SansLight',
                          color: Colors.white.withOpacity(1.0),
                        ),
                        //STYLE of textbox border
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        contentPadding: const EdgeInsets.only(bottom: 4),
                        helperStyle: const TextStyle(height: 0.8),
                      ),
                    ),
                  ),
                ),
    
                //TEXTBOX: Email input 
                Padding(
                  padding: const EdgeInsets.only(left: 36, top: 45),
                  // ignore: sized_box_for_whitespace
                  child: Container(
                    width: 329,
                    child: TextFormField(
                      //TEXT CONTROLLER
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
                        contentPadding: const EdgeInsets.only(bottom: 4),
                        helperStyle: const TextStyle(height: 0.8),
                      ),
                    ),
                  ),
                ),
    
                //TEXTBOX: Password input 
                Padding(
                  padding: const EdgeInsets.only(left: 36, top: 45),
                  // ignore: sized_box_for_whitespace
                  child: Container(
                    width: 329,
                    child: TextFormField(
                      //TEXT CONTROLLER
                      controller: passwordInput,

                      //STYLE of user input text
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
                        contentPadding: const EdgeInsets.only(bottom: 4),
                        helperStyle: const TextStyle(height: 0.8),
                      ),
                    ),
                  ),
                ),
    
                //Box for spacing
                const SizedBox(height: 12),
    
                //RICH TEXT: Terms & Conditions, Privacy and Cookie Policy
                Padding (
                  padding: const EdgeInsets.only(left: 36, top: 1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [

                            
                            const TextSpan(
                              text: 'By creating an account, you agree to our ',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Fragment_SansLight',
                                color: Colors.white,
                              ),
                            ),

                            //TERMS OF USE: Linked
                            TextSpan(
                              text: 'Terms of use',
                              style: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Fragment_SansLight',
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                              //Redirects to Terms of Use
                              recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Handle tap on Terms & Conditions
                                const url = ("https://www.heartfulnessinstitute.org/terms-of-use"); 
                                launchUrl(Uri.parse(url));
                              },
                            ),
                        
                            const TextSpan(
                              text: ' and ',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Fragment_SansLight',
                                color: Colors.white,
                              ),
                            ),
                        
                            //PRIVACY AND COOKIE POLICY
                            TextSpan(
                              text: 'Privacy and Cookie Policy',
                              style: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Fragment_SansLight',
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                              //Redirects to privacy and cookie policy
                              recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Handle tap on Privacy Policy
                                const url = ("https://www.heartfulnessinstitute.org/privacy-policy"); 
                                launchUrl(Uri.parse(url));
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              
               //Box for spacing
              const SizedBox(height: 55),

              //BUTTON: Create Account 
              Center(
                child: TextButton(
                  //ON PRESSED: calls sign in function
                  onPressed: () {
                    signUserUp(context);
                  }, 

                  //STYLE of the text button
                  style: TextButton.styleFrom(
                    fixedSize: const Size(329, 48),
                    //Setting border radius of text box
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    backgroundColor: const Color.fromARGB(255, 254, 176, 67), // Change the color here
                  ),

                  //TEXT
                  child: const Text(
                    'Continue',
                    //STYLE of continue 
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Fragment_SansLight',
                      color: Colors.white,
                    )
                  ),
                ),
              ),

          //BUTTON: Sign in with the google 
          Padding(
            padding: const EdgeInsets.only(left: 31, top: 80),
            child: TextButton(
              //FUNCTION: on pressed 
              onPressed: () {
                authService.signInWithGoogle().then(
                  (userCredential) {
                    // Handle the successful sign-in with Google here
                    signUserUp(context);
                  }
                )
                .catchError(
                  (error) {
                    // Handle any errors that occur during the sign-in process
                    errorGmailSignIn(context);
                  }
                ); 
              },

              //STYLE of button
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
                    //Sign in text
                    const Padding(
                      padding: EdgeInsets.only(left: 75),
                      child: Text(
                        'Sign in with ',
                        //text style
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
                    
                    //Google logo
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

          //TEXT BUTTON: Already have an account? Sign In.
          Center(
            child: TextButton(
              //ON PRESSED: Directs to create account page
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/sign-in');
              }, 

              //STYLE of text
              child: const Text(
                "Already have an account? Sign in.",
                style: TextStyle(
                 fontSize: 12,
                  fontFamily: 'Fragment_SansLight',
                  color: Colors.white,
                ),
              ),
            ),
          ),
          ],
        ),
      ),
    ],
    ),
  ),
  );
}
}