import 'package:flutter/material.dart';

class Numpad extends StatelessWidget {
  Numpad({super.key, required this.child, required this.onTap});
  final String child;
  final VoidCallback onTap;
  var buttonColor = Color.fromARGB(151, 3, 3, 3);

  @override
  Widget build(BuildContext context) {
    if (child == "C") {
      buttonColor = Color.fromARGB(255, 235, 164, 34);
    } else if (child == "SİL") {
      buttonColor = Colors.red;
    } else if (child == "=") {
      buttonColor = Color.fromARGB(255, 52, 179, 52);
    }
    return Padding(
      padding: EdgeInsets.all(4),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: buttonColor,
          ),
          child: Center(
            child: Text(
              child,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
