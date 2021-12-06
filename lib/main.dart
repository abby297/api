import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:convert';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    Api_app(),
  );
}

class Api_app extends StatefulWidget {
  @override
  _Api_appState createState() => _Api_appState();
}

class _Api_appState extends State<Api_app> {
  final userid_controller = TextEditingController();
  final password_controller = TextEditingController();
  final question_controller = TextEditingController();

  Future submit() async {
    String U = userid_controller.text;
    String P = password_controller.text;
    String Q = question_controller.text;

    setState(() {
      FirebaseAuth.instance.signInWithEmailAndPassword(
          email: "manchester@gmail.com", password: "firebase22");
    });
    // ignore: avoid_print
    print("login denied");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green[700],
            title: Center(
              child: Text(
                "Api DEMO",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Container(
                color: Colors.green[300],
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                        child: Container(
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black38),
                      padding: EdgeInsets.all(5),
                      //color: Colors.blue,
                      child: Text(
                        "Log In",
                        style: TextStyle(
                            backgroundColor: Colors.green[500],
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                    Card(
                      elevation: 7,
                      child: TextField(
                        cursorColor: Colors.green,
                        controller: userid_controller,
                        onSubmitted: (_) => submit(),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "UseriD",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Card(
                      elevation: 7,
                      child: TextField(
                        controller: password_controller,
                        keyboardType: TextInputType.visiblePassword,
                        onSubmitted: (_) => submit(),
                        decoration: InputDecoration(
                          labelText: "Password",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Card(
                      elevation: 7,
                      child: TextField(
                        controller: question_controller,
                        keyboardType: TextInputType.text,
                        onSubmitted: (_) => submit(),
                        decoration: InputDecoration(
                          labelText: "SecretQuestion",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          FlatButton(
                            color: Colors.green,
                            hoverColor: Colors.lightGreen,
                            onPressed: submit,
                            child: Text(
                              "Enter",
                              style: TextStyle(
                                  color: Colors.black,
                                  backgroundColor: Colors.green,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 90,
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "All Rights Reserved.",
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
