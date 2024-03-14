import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'settings.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => homeState();
}

class homeState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  late var tct=TabController(length: 4, vsync: this);
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery
        .of(context)
        .size
        .height;
    double w = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
        body: TabBarView(
          children: [
            Container(),
            Container(),
            Container(),
            SettingsScreen()
          ],
          controller: tct,
        ),
      bottomNavigationBar: TabBar(
        controller: tct,
        tabs: [
          Tab(
            icon: Icon(Icons.home),
            text: "Home",
          ),
          Tab(
            icon: Icon(Icons.search),
            text: "Search",
          ),
          Tab(
            icon: Icon(Icons.bookmark_border_sharp),
            text: "Saved",
          ),
          Tab(
            icon: Icon(Icons.account_circle),
            text: "You",
          ),
        ],
      ),
    );
  }
}
