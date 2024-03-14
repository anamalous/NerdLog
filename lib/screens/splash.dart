import 'dart:async';
import 'login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home.dart';

class Splash extends StatefulWidget{
  const Splash({super.key});

  @override
  State<Splash> createState() => splashState();
}

class splashState extends State<Splash>{
  @override
  void initState(){
    super.initState();

    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => (FirebaseAuth.instance.currentUser!=null)?HomeScreen():LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context){
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: h,
        width: w,
        color: Colors.black,
        alignment: Alignment.center,
        child:Text("NerdLog",style: TextStyle(color: Colors.white,fontFamily: "font1"),),
      ),
    );
  }
}