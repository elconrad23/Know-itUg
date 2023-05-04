import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:know_it/knowit_exporter.dart';
import 'package:flutter/material.dart';
import '../auth/services/FirebaseUIActivity.java';
import '../auth/services/auth_services.dart';
// import 'package:url_launcher/url_launcher.dart';
// import'package:google_fonts/google_fonts.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
final TextEditingController emailAddressController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
String emailHint = "someone@example.com";
String passwordHint = "Password";

  @override
  Widget build(BuildContext context) {

    _launchURL() async {
      Uri _url = Uri.parse('https://www.google.com');
      if (await launchUrl(_url)) {
        await launchUrl(_url);
      } else {
        throw 'Could not launch $_url';
      }
    }

    return Scaffold(
      backgroundColor: knowItOrange,
      body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image:  AssetImage("knowit_mini.png",
              ),
            ),
           Text(
            "Login here!",
            style: GoogleFonts.bebasNeue(
              fontSize: 54,
               ),
          ),

          //email textfield
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.amber,
                border: Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: emailAddressController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: emailHint,
                ),
              ),
            ),
            
          ),
          //password textfield
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.amber,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: passwordHint,
                    ),
                  ),
                ),
              ),
            ),
          const SizedBox(height: 10),
 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                //google button
                  InkWell(
                    onTap: () => AuthService().signInWithGoogle(),
                    child: Container(
                      width: 56,
                      height: 56,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),                   
                      color: Colors.white,
                      child: 
                        const Image(image: AssetImage('google_logo.png')),
                      ),
                    ),
                  
                const SizedBox(
                  height: 15,
                ),

                //gmail button
                  InkWell(
                    onTap: () => AuthService().signInWithGoogle(),
                    child: Container(
                      width: 56,
                      height: 56,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),                   
                      color: Colors.white,
                      child: 
                        const Image(image: AssetImage('google_logo.png')),
                    ),
                ),
              ],
            ),
          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: knowItTeal,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
                  child: ElevatedButton(
                    onPressed:(){
                      loginFunction();
                    }, child: const Text(
                        'Sign in',
                        style: TextStyle(
                      color: knowItOrange,
                      fontWeight: FontWeight.bold,),),
                    ),
                  ),
                    ),
                  const SizedBox(height: 10,
                  ),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: knowItTeal,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
                  child: RichText(
                      text:  TextSpan(
                    children: [
                      const TextSpan(text:'By clicking Sign in, you agree to our terms and conditions.',
                        style: TextStyle(
                          color: knowItOrange,
                          fontWeight: FontWeight.bold,
                        ),),
                      TextSpan(text: 'our terms and conditions.',
                        style: const TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),        recognizer: TapGestureRecognizer()..onTap = _launchURL,
                    ),
                  ]
                  ),
                  ),
                    ),
                  ),
                  const SizedBox(height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Not a member?",
                        style: TextStyle(
                          color: knowItOrange,
                          fontWeight: FontWeight.bold,
                      ),),
//make this a link to registration page
                      Text(" Register now",
                      style: TextStyle(
                        color: knowItOrange,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ],
                  ),]
      ),
      ),);
  }
  
  Future<void> loginFunction() async {
        try {
          var emailAddress = emailAddressController.text.toLowerCase();
          var password = passwordController.text;  
          final credential = await FirebaseAuth.instance.getUserWithEmailAndPassword(
          email: emailAddress,
          password: password,
        );
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    emailHint = 'No user found for that email.';
  } else if (e.code == 'wrong-password') {
    passwordHint = 'Wrong password provided for that user.';
  }
}
 }
}