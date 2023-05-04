import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:know_it/knowit_exporter.dart';
import '../auth/services/auth_services.dart';
import 'login.dart';
// import 'package:url_launcher/url_launcher.dart';
// import'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String passwordHint = "password";
  String emailHint = "example@gmail.com";
  
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();

  @override
  Future<Widget> build(BuildContext context) async {
    
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
              image: AssetImage(
                "knowit_mini.png",
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
                  controller: EmailController,
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
                child:  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: TextField(
                    controller: PasswordController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: passwordHint,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
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
                  child: ElevatedButton(
                    onPressed: () {
                      signUpFunction();
                    }, 
                    child: const Text("Sign Up"),
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
                    child: const Image(image: AssetImage('google_logo.png')),
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
                    child: const Image(image: AssetImage('google_logo.png')),
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
                child: const Text(
                  'Sign in',
                  style: TextStyle(
                    color: knowItOrange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
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
                  text: TextSpan(children: [
                    const TextSpan(
                      text: 'By clicking Sign in, you agree to ',
                      style: TextStyle(
                        color: knowItOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'our terms and conditions.',
                      style: const TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = _launchURL,
                    ),
                  ]),
                ),
              ),
            ),
            
            const SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Already a member?",
                        // selectionRegistrar: SelectionContainer.maybeOf(context),
                        // selectionColor: const Color(0xAF6694e8),
                        style: TextStyle(
                          color: knowItBlack,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      //make this a link to registration page
                      TextSpan(
                        text: " Login now",
                        // selectionRegistrar: SelectionContainer.maybeOf(context),
                        // selectionColor: Color(0xAF6694e8),
                        style: const TextStyle(
                          color: knowItOrange,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = const LoginPage() as GestureTapCallback?,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
    
      signUpFunction() async {
        try {
          var emailAddress = EmailController.text.toLowerCase();
          var password = PasswordController.text;  
          final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailAddress,
          password: password,
        );
      } on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    passwordHint = 'The password provided is too weak.';
  } else if (e.code == 'email-already-in-use') {
    emailHint = 'The account already exists for that email.';
  }
} catch (e) {
  print(e);
}
      }
  }
