import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formkey = GlobalKey<FormState>();
  movetohome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushNamed(context, MyRoutes.homeroute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/login.png",
                  fit: BoxFit.cover,
                ),
                Text(
                  "Welcome $name",
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Enter Username",
                          labelText: "Username:",
                        ),
                        validator: (String? value) {
                          if (value != null && value.isEmpty) {
                            return "This field is required";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password:",
                        ),
                        validator: (String? value) {
                          if (value != null && value.isEmpty) {
                            return "This field is required";
                          } else if (value != null && value.length < 6) {
                            return "password length must be greater than 6";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 40.0,
                      )
                    ],
                  ),
                ),
                Material(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                  child: InkWell(
                    splashColor: Colors.red,
                    onTap: () => movetohome(context),
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      width: changeButton ? 50 : 100,
                      height: 50,
                      alignment: Alignment.center,
                      child: changeButton
                          ? const Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : const Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                      /*decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            shape:
                                changeButton ? BoxShape.circle : BoxShape.rectangle,
                            borderRadius:
                                BorderRadius.circular(changeButton ? 50 : 8))*/
                    ),
                  ),
                )

                /*ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, MyRoutes.homeroute);
                  },
                  child: const Text("Login"),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.pink, minimumSize: Size(150, 40)),
                )*/
              ],
            ),
          ),
        ));
  }
}
