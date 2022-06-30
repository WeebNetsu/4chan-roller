import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // for copy to clipboard
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var rand = Random();
  String randomNumber = "Roll for your number!";

  // This function is triggered when the copy icon is pressed
  void _copyToClipboard() {
    Clipboard.setData(ClipboardData(text: randomNumber)).then(
      (_) => {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Copied to clipboard'),
            duration: Duration(seconds: 3),
          ),
        )
      },
      onError: (err) => {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Could not copy to clipboard'),
            duration: Duration(seconds: 3),
          ),
        ),
        debugPrint(err)
      },
    );
  }

  void _generateRandomNumber() {
    String result = "";

    for (var i = 0; i < 9; i++) {
      result += rand.nextInt(10).toString();
    }

    setState(() {
      randomNumber = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SizedBox(
        height: windowHeight,
        width: windowWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              // child: Text(
              //   randomNumber,
              //   style: TextStyle(
              //     fontWeight: FontWeight.bold,
              //     fontSize: 20,
              //     letterSpacing:
              //         randomNumber == "Roll for your number!" ? 0 : 2,
              //   ),
              // ),
              child: TextButton(
                onPressed: () => {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Hold to copy!'),
                      duration: Duration(seconds: 1),
                    ),
                  ),
                },
                onLongPress: _copyToClipboard,
                child: Text(
                  randomNumber,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20,
                    letterSpacing:
                        randomNumber == "Roll for your number!" ? 0 : 3,
                  ),
                ),
              ),
            ),
            MaterialButton(
              onPressed: _generateRandomNumber,
              color: Colors.black,
              textColor: Colors.white,
              minWidth: windowWidth - 100,
              child: const Text("Roll!"),
            ),
          ],
        ),
      ),
    );
  }
}
