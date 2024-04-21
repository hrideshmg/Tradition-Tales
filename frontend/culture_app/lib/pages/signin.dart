import 'dart:ui';
import "package:culture_app/util/global.dart";
import 'package:culture_app/Navigator.dart';
import 'package:culture_app/pages/home_page.dart';
import 'package:culture_app/pages/signup.dart';
import 'package:flutter/cupertino.dart';
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
  final loginUrl = apiUrl + "account/login/";

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

      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => Navigation1())));
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
      body: Expanded(
        child: Stack(
          children: [
            Image.network(
                "https://images.unsplash.com/photo-1582314437409-7a48e94a6511?q=80&w=3120&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity),
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                    Colors.transparent,
                    Color.fromARGB(255, 0, 0, 0)
                  ],
                      stops: [
                    0.25,
                    0.9
                  ])),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 495,
                    ), //495
                    const SizedBox(
                      height: 18,
                    ),
                    TextField(
                      style: const TextStyle(color: Colors.white),
                      controller: UserNameController,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintText: "Username",
                          hintStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          suffixIcon: const Icon(
                            Icons.person,
                            color: Colors.white,
                          )),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    TextField(
                      obscureText: true,
                      style: const TextStyle(color: Colors.white),
                      controller: PasswordController,
                      decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: const TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          suffixIcon: const Icon(
                            Icons.password,
                            color: Colors.white,
                          )),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    ElevatedButton(onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (_) => const HomePage()));}, child: Text("Homepage")),
                    Row(
                      children: [
                        Text("Don't have an account?",
                            style: TextStyle(color: Colors.white)),
                        SizedBox(
                          width: 9,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              SlideRightRoute(page: SignUp()),
                            );
                          },
                          child: const Text(
                            "Sign-up",
                            style: TextStyle(color: Color(0xff4782ba)),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          sendPostRequest();
                        },
                        child: Text(
                          "Sign-In",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            minimumSize: MaterialStateProperty.all(
                                const Size(double.infinity, 50)),
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xff4782ba)))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
