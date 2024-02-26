import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

class Community {
  String communityId = "";
  String name = "";
  List<String> members = [];
  List<String> admins = [];
  List<Group> groups = [];

  Community(String communityId, String name, String members, String admins, DatabaseReference comGrpRef){
    this.communityId = communityId;
    this.name = name;
    this.members = convertStringToList(members);
    this.admins = convertStringToList(admins);

    getGroups(comGrpRef).then((value){
      this.groups = value;
    });
  }

  Future<List<Group>> getGroups(DatabaseReference comGrpRef) async{
    List<Group> groups = [];
    int grpId = 1001;
    DatabaseReference grpRef = comGrpRef.child(grpId.toString());
    DataSnapshot grpSnapshot = await grpRef.get();

    while(grpSnapshot.exists){
      DataSnapshot nameSnapShot = await grpRef.child('name').get();
      DataSnapshot descSnapShot = await grpRef.child('description').get();
      List<Chat> chats;
      getChats(grpRef).then((value){
        chats = value;
      });

      grpId++;
      grpRef = comGrpRef.child(grpId.toString());
      grpSnapshot = await grpRef.get();
    }

    return groups;
  }

  Future<List<Chat>> getChats(DatabaseReference grpRef) async{
    List<Chat> chats = [];
    DatabaseReference grpChatRef = grpRef.child('Chats');
    int chatId = 1000000001;
    DatabaseReference chatRef = grpChatRef.child(chatId.toString());
    DataSnapshot chatSnapshot = await chatRef.get();

    while(chatSnapshot.exists){
      DataSnapshot senderSnapshot = await chatRef.child('sender').get();
      DataSnapshot messageSnapshot = await chatRef.child('message').get();
      chats.add(Chat(senderSnapshot.value.toString(), messageSnapshot.value.toString()));

      chatId++;
      chatRef = grpChatRef.child(chatId.toString());
      chatSnapshot = await chatRef.get();
    }

    return chats;
  }
}

class Group {
  String groupId;
  String name;
  List<Chat> chats;

  Group(this.groupId, this.name, this.chats);
}

class Chat {
  String sender;
  String message;

  Chat(this.sender, this.message);
}


void getCommunities(User? _user, DatabaseReference dbRef) async{
  print(_user);
    print(_user!.email.toString().substring(0, _user!.email.toString().length-4));
    DatabaseReference userRef = dbRef.child('Users').child(_user!.email.toString().substring(0, _user!.email.toString().length-4));
    print(userRef.path);
    final userSnapshot = await userRef.get();
    print(userSnapshot.value.toString());
    if(userSnapshot.exists){
      DatabaseReference userComRef = userRef.child('communities');
      final userComSnapshot = await userComRef.get();
      String comString = userComSnapshot.value.toString();
      List<String> comList = convertStringToList(comString);
      
    }
    else{
      print("no");
    }
}

List<String> convertStringToList(String s){
  List<String> list= [];
  String sub = "";
  for(int i=0; i<s.length; i++){
    if(s[i]==','){
      list.add(sub);
      sub = "";
    }
    sub = sub + s[i];
  }
  return list;
}

List<Community> extractCommunities(List<String> comList, DatabaseReference dbRef){
  List<Community> extractedComs = [];
  DatabaseReference dbComRef = dbRef.child('Communities');
  for(int i=0; i<comList.length; i++){
    DatabaseReference comRef = dbComRef.child(comList[i]);

  }
  
  
  return extractedComs;
}
