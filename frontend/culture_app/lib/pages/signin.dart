import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(

        // decoration:const BoxDecoration(
        //   image: DecorationImage(image: AssetImage("assets/images/Totem.jpg"),fit: BoxFit.cover),
        //   gradient: RadialGradient(center: Alignment.center,radius: 1.0,colors: <Color>[Colors.blue,Colors.white],stops: [0.1,1.0]),
        // ),
        children:  [
          Image.asset("assets/images/pooram.jpeg",fit: BoxFit.cover,height: double.infinity,),
          Container(decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter,colors: <Color>[Colors.transparent,Color.fromARGB(255, 0, 0, 0)],stops: [0.25,0.9])
          ),),
          Padding(
          padding:const EdgeInsets.all(25.0),
          child:  SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              const  SizedBox(height: 495,),
              const SizedBox(height: 18,),
              TextField(
                style:const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: "username",
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(borderRadius:BorderRadius.circular(12)),
                  suffixIcon:const Icon(Icons.person,color: Colors.white,)
                ),
              ),
              const SizedBox(height: 18,),
              TextField(
                style:const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "password",
                  hintStyle:const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  suffixIcon: const Icon(Icons.password,color: Colors.white,)
                ),
              ),const SizedBox(height: 22,),
              Row(
                children: [
                  Text("Don't have an account?",style: TextStyle(color: Colors.white)),
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
        )],
      ),
    );
  }
}