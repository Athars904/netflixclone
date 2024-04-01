import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'constants.dart';
import 'login_page.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'authentication_repo.dart';
class Registeration_page extends StatefulWidget {
  static const String id='registeration_page';
  const Registeration_page({super.key});

  @override
  State<Registeration_page> createState() => _Registeration_pageState();
}
class _Registeration_pageState extends State<Registeration_page> {
  bool showSpinner=false;
  late String email;
  late String password;
  final _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/flix.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Text(
                  'Register to Netflix',
                  style: klabelText,
                ),
                const SizedBox(height: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextField(
                      decoration: kInputDecoration.copyWith(labelText: 'Email here'),
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(color: Colors.white),

                      onChanged: (value) {
                        email = value;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      decoration: kInputDecoration,
                      obscureText: true,
                      style: const TextStyle(color: Colors.white),
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                    const SizedBox(height: 32.0),
                    ElevatedButton(
                      onPressed: () async{
                        setState(() {
                          showSpinner=true;
                        });
                        try{
                          final newUser=await _auth.createUserWithEmailAndPassword(email: email, password: password);
                          Navigator.pushNamed(context, NetflixLoginPage.id);
                        }
                        catch(e)
                        {
                          print(e);
                        }
                        setState(() {
                          showSpinner=false;
                        });

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                      child: const Text('Sign Up',
                        style: TextStyle(
                            color: Colors.white
                        ),),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Container(
                    height: 40.0, // Adjust height as needed
                    width: 100.0, // Adjust width as needed
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0), // Adjust radius as needed
                    ),
                  child: GestureDetector(
                    onTap: signInWithGoogle,
                    child: Image(image: AssetImage('assets/images/google_logo.png'),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
