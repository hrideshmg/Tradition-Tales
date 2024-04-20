import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    return Container();
  }
}
