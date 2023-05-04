import 'package:firebase_auth/firebase_auth.dart';
// ignore: depend_on_referenced_packages
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  //Google sign in
  signInWithGoogle() async {
    //interactive process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    //obtain details
    final credentials = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    //finally, sign in
    return await FirebaseAuth.instance.signInWithCredential(credentials);
  }
}
