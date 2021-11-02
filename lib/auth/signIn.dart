import 'package:cloud_firestore/cloud_firestore.dart';
/////Login
import 'package:flutter/material.dart';
import 'package:shopping_app/auth/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopping_app/views/homePage.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    signIn() async {
      FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseFirestore db = FirebaseFirestore.instance;
      final String email = emailController.text;
      final String password = passwordController.text;
      try {
        final UserCredential user = await auth.signInWithEmailAndPassword(
            email: email, password: password);
        final DocumentSnapshot snapshot =
            await db.collection('users').doc(user.user.uid).get();
        final data = snapshot.data;
        print("User SignIn Successfully");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } catch (e) {
        return e;
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(23.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  " Hello",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(" There",
                        style: TextStyle(
                            fontSize: 55, fontWeight: FontWeight.bold)),
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
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'EMAIL'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(labelText: 'PASSWORD'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 200.0),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Text(
                        "Forgot Password?",
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
                    onPressed: signIn,
                    child: Text(
                      "SignIn",
                      style: TextStyle(fontSize: 25),
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
