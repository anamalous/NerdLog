import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nerdlog/screens/login.dart';

class SettingsScreen extends StatefulWidget{
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => settingState();
}

class settingState extends State<SettingsScreen>{
  @override
  Widget build(BuildContext context){
    return Container(
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("users")
            .where("uid",isEqualTo: FirebaseAuth.instance.currentUser!.uid).snapshots(),
        builder: (context,snapshot){
          return (snapshot.connectionState==ConnectionState.waiting)?
              Center(child: CircularProgressIndicator(),):
              ListView.builder(
                  itemBuilder: (context,index){
                    var d=snapshot.data!.docs[0];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(d["uname"],style: TextStyle(fontFamily: "font1",color: Colors.white,fontSize: 40),),
                        TextButton(onPressed: (){
                          FirebaseAuth.instance.signOut();
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext c)=>LoginScreen()));
                          }, child: Text("bye"))
                      ],
                    );
                  }
                  );
        }
      ),
    );
  }
}