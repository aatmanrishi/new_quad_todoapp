import 'package:flutter/material.dart';
import 'package:new_quad_todoapp/Pages/SignIn.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // This function will handle the navigation to Home
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignIn()),
      );
    });

    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/applogo.png",
          height: 300,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
