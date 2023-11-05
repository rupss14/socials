import 'dart:js';
import 'package:socials/posts.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:socials/profile.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      color: Colors.blue,
        child: Center(
          child: Text('Socials',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),
  );

  Future.delayed(Duration(seconds: 5), () {
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(), // Replace MainScreen with your main app screen widget.
    ));
  });
}

Future<void> signUpWithEmailAndPassword(String email, String password) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    // User is signed up
  } catch (e) {
    // Handle sign-up errors (e.g., invalid email, weak password, email already in use).
  }
}

Future<void> signInWithEmailAndPassword(String email, String password) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    // User is signed in
    // Navigate to the main screen.
    Navigator.pushReplacement(
      context as BuildContext,
      MaterialPageRoute(builder: (context) => MainScreen()),
    );
  } catch (e) {
    // Handle sign-in errors (e.g., user not found, invalid credentials).
  }
}
Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
  // User is signed out
}


class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Main Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Handle the button press (e.g., navigate to the create post screen).
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.blue, // Set the background color
            onPrimary: Colors.white, // Set the text color
            padding: EdgeInsets.all(16), // Set padding
            shape: RoundedRectangleBorder( // Define the button shape
              borderRadius: BorderRadius.circular(10),
            ),
          ),
         child: Text('Welcome to the Main Screen!'),
      ),
        child: Text(
            "Create Post",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
    );
  }
}




