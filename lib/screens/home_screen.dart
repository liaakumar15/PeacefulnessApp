import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peacefulness_app/screens/daily_checkin.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen ({super.key}); //TEMPORARY, check auth and main dart pages
  //final String firstName;
  //const HomeScreen({required this.firstName, Key? key}) : super(key: key);
//final user = FirebaseAuth.instance.currentUser;

//MAIN BODY
@override
  Widget build(BuildContext context) {
    //Sets height of background container
    double containerHeight = MediaQuery.of(context).size.height * (5 / 8);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
        children: [
          //Background image
          Align(
            alignment: Alignment.center,
            key: UniqueKey(),
            child: Image.asset(
              'assets/img/Group 141.png',
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 35, left: 255),
            child: SvgPicture.asset(
              'assets/img/HFN_Peacefulness_Logo.svg',
            ),
          ),

          //CONTAINER: Gray background
          //Aligned along bottom edge of screen
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
                //Width = width of the screen
                width: MediaQuery.of(context).size.width,
                //Height is defined above
                height: containerHeight,
                decoration: BoxDecoration(
                //Color
                color: const Color.fromRGBO(57, 56, 52, 1),
                //Rounded Edges
                borderRadius: BorderRadius.circular(15),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  //TEXT: Hi User 
                  const Padding(
                    padding: EdgeInsets.only(left: 25, top: 25),
                    child: Text(
                      'Hi [User]!',
                      //STYLE
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'Fragment',
                        color: Colors.white,
                      ),
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                   
                  //BUTTON: Daily Check In
                  Center(
                    child: Padding (
                      padding: const EdgeInsets.only(top: 30),
                      child: TextButton(
                        //FUNCTION redirects to daily check in
                        onPressed: () {
                           showModalBottomSheet(
                            context: context,
                            builder: (context) => const DailyCheckScreen(), // Your SlideUpScreen widget
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                           );
                        }, 
                
                        //STYLE of button
                        style: TextButton.styleFrom(
                          //Size: (width, height)
                          fixedSize: const Size(335, 45),
                          //Rounded edges of button
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          ),
                          //Button Color
                          backgroundColor: const Color.fromRGBO(214, 108, 19, 1),
                          //Aligns button text to the left
                          alignment: Alignment.centerLeft,
                          //Adds padding to button text
                          padding: const EdgeInsets.only(left: 20),
                        ),

                        //Creates ROW to organize content on button
                        child: Row(
                          children: [

                          //TEXT
                          const Text(
                            'How are you feeling today?',
                            //STYLE
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Fragment_SansLight',
                              color: Colors.white,
                            ),
                          ),
                          
                          //Arrow Symbol
                          Padding(
                            // Add space between text and arrow
                            padding: const EdgeInsets.only(left: 45), 
                            child: Image.asset(
                              'assets/img/Arrow.png',
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
          ),
        ],
      ),
    ),
   );
  }
}






            
          