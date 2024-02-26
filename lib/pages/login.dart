import 'package:community_chat_forum/components/text_field.dart';
import 'package:community_chat_forum/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:community_chat_forum/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? _user;

  @override
  void initState(){
    super.initState();
    _auth.authStateChanges().listen((event) {
      setState(() {
        _user = event;
      });
    });
  }

  void _handleGoogleSignIn() async{
    try{
      GoogleAuthProvider _googleAuthProvider =  GoogleAuthProvider();
      await _auth.signInWithProvider(_googleAuthProvider);
      Navigator.pushReplacementNamed(context, '/', arguments: {
        'user': _user,
     });
     // Navigator
    } catch(error){
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[700],
      body: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/login_bg.jpg'),
                fit: BoxFit.cover,
                opacity: 0.4,
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget> [
                Image.asset('assets/comchat_icon.jpg'),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 45.0),
                  child: SizedBox(
                    height: 50.0,
                    child: SignInButton(Buttons.google,
                      text: "Sign in with Google",
                      onPressed: () {_handleGoogleSignIn();},
                    ),
                  ),
                )
              ],
            ),
          )
        )
      ),
    );
  }
}
