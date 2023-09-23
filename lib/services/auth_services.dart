import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {

  //Google Sign In
  Future<UserCredential?> signInWithGoogle() async {
    // Begin interactive sign-in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    if (gUser != null) {
      // Obtain auth details from request
      final GoogleSignInAuthentication gAuth = await gUser.authentication;

      // Create a new credential for the user
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      // Finally, let's sign in with the credential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }

    // Return null if the user canceled the sign-in process
    return null;
  }

  // Helper method to check if the user signed up with Google
  Future<bool> isGoogleSignIn() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userProviderData = user.providerData;
      return userProviderData.any((provider) => provider.providerId == "google.com");
    }
    return false;
  }
}


/*class AuthService {

  //Google Sign In
  signInWithGoogle() async {
   //begin interactive sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

   // obtain auth details from request
   final GoogleSignInAuthentication gAuth = await gUser!.authentication;

   //create a new credential for user
   final credential = GoogleAuthProvider.credential(
    accessToken: gAuth.accessToken,
    idToken: gAuth.idToken,
   );

   // Helper method to check if the user signed up with Google
  Future<bool> isGoogleSignIn() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userProviderData = user.providerData;
      return userProviderData.any((provider) => provider.providerId == "google.com");
    }
    return false;
  }

   // finally, lets sign in
   return await FirebaseAuth.instance.signInWithCredential(credential);
   }
}*/