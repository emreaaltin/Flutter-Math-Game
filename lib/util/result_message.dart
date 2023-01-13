import 'package:flutter/material.dart';
import 'package:mathgame/homepage.dart';

class ResultMessage extends StatelessWidget {
  ResultMessage(
      {super.key,
      required this.message,
      required this.onTap,
      required this.icon,
      required this.color});
  final String message;
  final VoidCallback onTap;
  final icon;
  final color;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: color,
      content: Container(
        color: color,
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            SizedBox(
              height: 35,
            ),
            GestureDetector(
              onTap: onTap,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Icon(
                  icon,
                  size: 40,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
