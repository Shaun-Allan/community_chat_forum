import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? _user;

  @override
  void initState(){
    _auth.authStateChanges().listen((event) {
      _user = event;
    });
  }

  void _handleGoogleSignIn(){
    try{
      GoogleAuthProvider _googleAuthProvider =  GoogleAuthProvider();
      _auth.signInWithProvider(_googleAuthProvider);
    } catch(error){
      print(error);
    }
  }

}