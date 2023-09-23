import 'package:flutter/material.dart';

class SentEmailScreen extends StatelessWidget {
  const SentEmailScreen ({super.key});

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

            //HEADING: Sent 
            const Padding(
              padding: EdgeInsets.only(left: 31, top: 190),
              child: Text(
                'Sent!',
                //STYLE
                style: TextStyle(
                  fontSize: 70,
                  fontFamily: 'Fragment',
                  color: Colors.white,
                ),
              ),
            ),

            //SUB-HEADING: It happens to the best of us 
            const Padding(
              padding: EdgeInsets.only(left: 32, top: 270),
              child: Text(
                "Check you inbox for a link to reset your password.",
                style: TextStyle (
                  fontSize: 18,
                  fontFamily: 'Fragment_SansLight',
                  color: Colors.white,
                ),
              ),
            ),

            //BUTTON: Re-Submit 
            Padding(
              padding: const EdgeInsets.only(left: 31, top: 380),
              child: TextButton(
                //FUNCTION: Calls Sign In
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/forgot-password');
                }, 
                
                //STYLE
                style: TextButton.styleFrom(
                  fixedSize: const Size(329, 48),
                  //BORDER RADIUS SettingS
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  backgroundColor: const Color.fromARGB(255, 254, 176, 67), // Change the color here
                ),

                //TEXT
                child: const Text(
                  'Re-Submit',
                  //STYLE of text
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Fragment_SansLight',
                    color: Colors.white,
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}