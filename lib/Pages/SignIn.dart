import 'package:flutter/material.dart';
import 'package:new_quad_todoapp/Components/WideButton.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/signIn.png",
              height: 200,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 200,
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Enter Your Name",
                    contentPadding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            WideButton(
              title: "Sign In",
              bgcolor: Colors.redAccent,
              tcolor: Colors.white,
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
