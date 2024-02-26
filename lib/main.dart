import 'package:community_chat_forum/firebase_options.dart';
import 'package:community_chat_forum/pages/home.dart';
import 'package:community_chat_forum/pages/login.dart';
import 'package:community_chat_forum/pages/add_communities.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ComChat",
      initialRoute: "/login",
      routes: {
        "/": (context) => Home(),
        "/login": (context) => Login(),
        "addcom": (context) => AddCommunites(),
      },
    );
  }
}

