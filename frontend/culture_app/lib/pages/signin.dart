import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        color: null,
        child:  Padding(
          padding:const EdgeInsets.all(25.0),
          child:  SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("name"),
              const  SizedBox(height: 495,),
              const SizedBox(height: 18,),
              TextField(
                style:const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "username",
                  border: OutlineInputBorder(borderRadius:BorderRadius.circular(12)),
                  suffixIcon:const Icon(Icons.person,color: Colors.black,)
                ),
              ),
              const SizedBox(height: 18,),
              TextField(
                style:const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "password",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  suffixIcon: const Icon(Icons.password,color: Colors.black,)
                ),
              ),const SizedBox(height: 22,),
              Row(
                children: [
                  Text("Don't have an account?",style: TextStyle(color: Colors.black)),
                  SizedBox(width: 9,),
                  GestureDetector(
                    onTap: null,
                    child:const Text("Sign-up",style: TextStyle(color: Color(0xff4782ba)),),
                  )
                ],
              )
              ,const SizedBox(height: 75,),
              ElevatedButton(onPressed: null,child: Text("Sign-In",style: TextStyle(fontSize:18,color: Colors.white ),),style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                minimumSize: MaterialStateProperty.all(const Size(double.infinity,50)),backgroundColor:MaterialStateProperty.all(Color(0xff4782ba)) )),
            ],),
          ),
        ),
      ),
    );
  }
}