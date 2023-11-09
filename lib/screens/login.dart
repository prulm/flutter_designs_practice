import 'dart:async';

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final StreamController<int> _streamController = StreamController();
  var isVisible = false;
  var showStrengthBar = true;
  late String _password;
  late String password_strength;
  late Color password_strength_color;
  late double password_strength_level;
  FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _passwordFocusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      showStrengthBar = true;
    });
  }

  int passwordStrengthLevel(String s) {
    int strength = 0;

    RegExp letter_check = RegExp(r'^(?=.*?[A-Z, a-z])');
    RegExp number_check = RegExp(r'^(?=.*?[0-9])');
    RegExp special_char_check = RegExp(r'^(?=.*?[!@#$%^&*])');

    if (letter_check.hasMatch(s)) {
      if (_password.length < 6) {
        strength = 1;
      } else {
        strength++;
      }
    }
    if (number_check.hasMatch(s)) {
      if (_password.length < 6) {
        strength = 1;
      } else {
        strength++;
      }
    }
    if (special_char_check.hasMatch(s)) {
      if (_password.length < 6) {
        strength = 1;
      } else {
        strength++;
      }
    }
    return strength;
  }

  void password_strength_checker(String password) {
    int strength = passwordStrengthLevel(password);
    _streamController.add(strength);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.bottomCenter,
          width: 200,
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.cover,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Welcome Back!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ]),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.g_mobiledata, color: Colors.black),
                  Text(
                    "Login with Google",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                backgroundColor: Colors.white,
                alignment: Alignment.center,
                onPrimary: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 150),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Or Login with",
              style: TextStyle(
                color: Colors.grey[700],
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 16)),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: "Enter Email Address",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    width: 1,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            TextField(
              obscureText: !isVisible,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                        isVisible ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                  ),
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      width: 1,
                    ),
                  )),
              onChanged: (value) {
                _password = value;
                password_strength_checker(_password);
              },
            ),
            showStrengthBar
                ? Container(
                    width: 400,
                    height: 100,
                    child: StreamBuilder(
                        stream: _streamController.stream,
                        builder: (context, snapshot) {
                          if (snapshot.data == null || snapshot.data == 0) {
                            password_strength = "";
                            password_strength_color = Colors.grey;
                            password_strength_level = 0;
                          } else if (snapshot.data == 1) {
                            password_strength = "Weak";
                            password_strength_color = Colors.redAccent;
                            password_strength_level = 0.3;
                          } else if (snapshot.data == 2) {
                            password_strength = "Moderate";
                            password_strength_color = Colors.amberAccent;
                            password_strength_level = 0.65;
                          } else if (snapshot.data == 3) {
                            password_strength = "Strong";
                            password_strength_color = Colors.greenAccent;
                            password_strength_level = 1.0;
                          }
                          return Row(
                            children: [
                              Container(
                                width: 220,
                                height: 5,
                                margin: EdgeInsets.only(left: 8),
                                child: LinearProgressIndicator(
                                  value: password_strength_level,
                                  color: password_strength_color,
                                  backgroundColor: Colors.grey,
                                ),
                              ),
                              Container(
                                width: 70,
                                margin: EdgeInsets.only(left: 8),
                                child: Text(password_strength),
                              ),
                            ],
                          );
                        }),
                  )
                : SizedBox(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 2, 25, 44),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 200),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _passwordFocusNode.removeListener(_onFocusChange);
    _passwordFocusNode.dispose();

    super.dispose();
  }
}
