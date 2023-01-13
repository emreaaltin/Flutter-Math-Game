import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mathgame/util/numpad.dart';
import 'package:mathgame/util/result_message.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String Cevap = "";
  List<String> numPad = [
    "7",
    "8",
    "9",
    "C",
    "4",
    "5",
    "6",
    "SİL",
    "1",
    "2",
    "3",
    "=",
    "0",
  ];
  int sayi1 = 10;
  int sayi2 = 5;
  void ButtonTapped(String button) {
    setState(
      () {
        if (button == "C") {
          Cevap = "";
        } else if (button == "=") {
          checkResult();
        } else if (button == "SİL") {
          Cevap = Cevap.substring(0, Cevap.length - 1);
        } else if (Cevap.length < 3) {
          Cevap += button;
        }
      },
    );
  }

  var RandomNumber = Random();
  void SonrakiSoru() {
    Navigator.of(context).pop();
    // rastgele sayı için
    setState(() {
      sayi1 = RandomNumber.nextInt(70);
      sayi2 = RandomNumber.nextInt(70);
      Cevap = "";
    });
  }

  void OncekiSoru() {
    Navigator.of(context).pop();
    setState(() {
      Cevap = "";
    });
  }

  void checkResult() {
    if (sayi1 + sayi2 == int.parse(Cevap)) {
      showDialog(
        context: context,
        builder: (context) {
          return ResultMessage(
              color: Colors.green,
              message: "Tebrikler!",
              onTap: SonrakiSoru,
              icon: Icons.skip_next);
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return ResultMessage(
              color: Color.fromARGB(255, 236, 4, 4),
              message: "Tekrar Deneyiniz!",
              onTap: OncekiSoru,
              icon: Icons.rotate_left);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        children: [
          Container(
            color: Color.fromARGB(151, 3, 3, 3),
            height: 110,
          ),
          Expanded(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    sayi1.toString() + " + " + sayi2.toString() + " = ",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Container(
                      child: Center(
                        child: Text(
                          Cevap,
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.circular(10)),
                      width: 130,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(2.5),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: numPad.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, index) {
                  return Numpad(
                    child: numPad[index],
                    onTap: () => ButtonTapped(
                      numPad[index],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
