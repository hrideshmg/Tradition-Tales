import 'dart:ui';
import 'package:culture_app/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late String username = UserNameController.text;

  final storage = const FlutterSecureStorage();
  final loginUrl = "127.0.0.1:800";

  TextEditingController UserNameController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();

  Future<dynamic> sendPostRequest() async {
    var response = await http.post(Uri.parse(loginUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "username": UserNameController.text,
          "password": PasswordController.text,
        }));

    if (response.statusCode == 200) {
      String token = jsonDecode(response.body)["token"];

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Sign in Succesfull"),
      ));
      await storage.write(key: 'token', value: token);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Sign in failed, please try again"),
      ));
    }
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children:  [
          Image.asset("assets/images/pooram.jpeg",fit: BoxFit.cover,height: double.infinity,),
          Container(decoration:const BoxDecoration(
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
                controller: UserNameController,
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
                controller: PasswordController,
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
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>const SignUp()));},
                    child:const Text("Sign-up",style: TextStyle(color: Color(0xff4782ba)),),
                  )
                ],
              )
              ,const SizedBox(height: 75,),
              ElevatedButton(onPressed: () {sendPostRequest();},
              child: Text("Sign-In",style: TextStyle(fontSize:18,color: Colors.white ),),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                minimumSize: MaterialStateProperty.all(const Size(double.infinity,50)),backgroundColor:MaterialStateProperty.all(Color(0xff4782ba)) )),
            ],),
          ),
        )],
      ),
    );
  }
}