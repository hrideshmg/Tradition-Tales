// import 'dart:js_util';

import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:culture_app/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:culture_app/pages/signin.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/profile.png",
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 300.0,
                  left: 12.0,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 25,
                    height: 160,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 1, color: Colors.black),
                        color: Colors.grey.shade100),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text("@Hridesh MG",
                              style: GoogleFonts.kellySlab(
                                  textStyle: TextStyle(
                                      fontSize: 24))), //font needs to be added
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "Festivals",
                                        style: TextStyle(
                                            fontFamily: "inter", fontSize: 18),
                                      ),
                                      Text(
                                        "      Experienced",
                                        style: TextStyle(
                                            fontFamily: "inter", fontSize: 18),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text("9",
                                      style: TextStyle(
                                          fontFamily: "inter", fontSize: 28)),
                                ],
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              //  VerticalDivider(thickness: 2,color: Colors.black,),
                              SizedBox(
                                width: 5,
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "Events",
                                        style: TextStyle(
                                            fontFamily: "inter", fontSize: 18),
                                      ),
                                      Text(
                                        "  Hosted",
                                        style: TextStyle(
                                            fontFamily: "inter", fontSize: 18),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text("11",
                                      style: TextStyle(
                                          fontFamily: "inter", fontSize: 28)),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                // SizedBox(height: 100,),
                Positioned(
                  top: 500,
                  left: 15,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 25,
                    height: 183,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 1, color: Colors.black),
                        color: Colors.grey.shade100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 18.0, top: 13),
                          child: Column(
                            children: [
                              Text(
                                "Change Password",
                                style: TextStyle(
                                    fontFamily: "inter", fontSize: 18),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Change Language",
                                style: TextStyle(
                                    fontFamily: "inter", fontSize: 18),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  width: 145.7,
                                  child: Text("Dark Mode",
                                      style: TextStyle(
                                          fontFamily: "inter", fontSize: 18))),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignIn()));
                          },
                          child: Text(
                            "Logout",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "inter"),
                          ),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              minimumSize: MaterialStateProperty.all(
                                  const Size(double.infinity, 50)),
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xff4782ba))),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
