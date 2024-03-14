import 'otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => loginState();
}

class loginState extends State<LoginScreen>{

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
              height: h*0.45,
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
                  Text("SIGN IN",style: TextStyle(fontFamily: "font1",fontSize: 20,color: Colors.white),),
                  Container(height: 30,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: ctrl,
                      decoration: InputDecoration(
                        hintText: "    enter contact"
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
                      onPressed: (){
                          FirebaseAuth.instance.verifyPhoneNumber(
                            phoneNumber: "+91"+ctrl.text.toString(),
                              verificationCompleted: (PhoneAuthCredential credential) {},
                              verificationFailed: (FirebaseAuthException e) {},
                              codeSent: (String verificationId, int? resendToken) {
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext contect) => OtpScreen(verid: verificationId)));
                              },
                              codeAutoRetrievalTimeout: (String verificationId) {}
                          );
                      },
                      child: Text("Get OTP",style: TextStyle(fontSize: 20,fontFamily: "font1",color: Colors.black),),
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