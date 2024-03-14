import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nerdlog/screens/home.dart';

class CreateUser extends StatefulWidget{
  var verid;
  CreateUser({super.key});
  @override
  State<CreateUser> createState() => userState();
}

class userState extends State<CreateUser>{

  var ctrl=TextEditingController();
  @override
  Widget build(BuildContext context){
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          height: h,
          width: w,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg.jpg"),
                colorFilter: ColorFilter.mode(Colors.grey.shade800, BlendMode.colorBurn),
                fit: BoxFit.cover,
              )
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Container(
                  padding: EdgeInsets.all(40),
                  height: h*0.5,
                  width: w*0.8,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(blurRadius: 10),
                        BoxShadow(blurRadius: 10),
                        BoxShadow(blurRadius: 10),
                        BoxShadow(blurRadius: 10),
                      ]
                  ),
                  child: Column(
                    children: [
                      Container(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.coffee_maker_rounded,size: 50,color: Colors.grey.shade200,),
                          Text(" NerdLog",style: TextStyle(color: Colors.grey.shade200,fontSize: 30,fontFamily: "font1"),)
                        ],
                      ),
                      Text("\na readers paradise <3",style: TextStyle(color: Colors.grey.shade200,fontSize: 15,fontFamily: "font1"),),
                      Container(height: 20,),
                      Text("Create User",style: TextStyle(fontFamily: "font1",fontSize: 20,color: Colors.white),),
                      Container(height: 30,),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: TextField(
                          controller: ctrl,
                          decoration: InputDecoration(
                              hintText: "    enter username"
                          ),
                        ),
                      ),
                      Container(height: 30,),
                      Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: TextButton(
                          onPressed: () async {
                              FirebaseFirestore.instance.collection("user").add({
                              "uid":FirebaseAuth.instance.currentUser!.uid,
                              "uname":ctrl.text.toString()});
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
                          },
                          child: Text("Login",style: TextStyle(fontSize: 20,fontFamily: "font1",color: Colors.black),),
                        ),
                      )
                    ],
                  ),
                ),
              ]
          )
      ),
    );
  }
}