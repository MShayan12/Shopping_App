import 'package:cloud_firestore/cloud_firestore.dart';
////Register

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopping_app/auth/signIn.dart';
import 'package:shopping_app/views/homePage.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  signUp() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore db = FirebaseFirestore.instance;

    final String username = usernameController.text;
    final String email = emailController.text;
    final String password = passwordController.text;
    try {
      final UserCredential user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await db.collection('users').doc(user.user.uid).set({
        'username': username,
        'email': email,
      });
      print("User SignUp Successfully");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } catch (e) {
      Container(
        child: Center(child: Text("error, try again!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(23.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                ),
                Row(
                  children: [
                    Text(" SignUp",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 60,
                            fontWeight: FontWeight.bold)),
                    Text(".",
                        style: TextStyle(
                            fontSize: 50,
                            color: Colors.greenAccent,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                      labelText: 'USERNAME',
                      labelStyle: TextStyle(fontWeight: FontWeight.w400)),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      labelText: 'EMAIL',
                      labelStyle: TextStyle(fontWeight: FontWeight.w400)),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      labelText: 'PASSWORD',
                      labelStyle: TextStyle(fontWeight: FontWeight.w400)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 150.0),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignIn()));
                      },
                      child: Text(
                        "already have an account ?",
                        style:
                            TextStyle(fontSize: 15, color: Color(0xff41e069)),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 60,
                  width: 350,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(23)),
                        primary: Color(0xff41e069),
                        onSurface: Colors.red),
                    onPressed: signUp,
                    child: Text(
                      "SignUp",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                SizedBox(
                  height: 50,
                  width: 350,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 8.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        primary: Colors.white,
                        onSurface: Colors.red),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Go back",
                      style: TextStyle(color: Colors.black, fontSize: 25),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
