import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:community_chat_forum/services/community.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int ind = 0;




  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, User?>;
    User? _user = args["user"];
    print(_user);


    DatabaseReference _dbref = FirebaseDatabase.instance.ref();
    print(_dbref.path);

    getCommunities(_user, _dbref);




    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        title: const Text('ComChat'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_sharp),
            hoverColor: const Color(0xff162773),
            onPressed: () {
              Navigator.pushNamed(context, 'addcom');
            },
          )
        ],
      ),
    );
  }
}
