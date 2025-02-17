import 'package:flutter/material.dart';

class DrawerProfileView extends StatelessWidget {
  const DrawerProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/applogo.png"),
            radius: 75,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Rishabh Shukla",
            style: TextStyle(
              fontFamily: 'Outfit',
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
