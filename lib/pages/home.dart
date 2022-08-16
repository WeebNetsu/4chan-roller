import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // for copy to clipboard
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _rand = Random();
  String _randomNumber = "Roll for your number!";

  // This function is triggered when the copy icon is pressed
  void _copyToClipboard() {
    Clipboard.setData(ClipboardData(text: _randomNumber)).then(
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
      result += _rand.nextInt(10).toString();
    }

    setState(() {
      _randomNumber = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () => Navigator.pushNamed(context, "/htp"),
                  icon: const Icon(Icons.question_mark_rounded),
                ),
                const SizedBox(width: 20),
              ],
            ),
            SizedBox(height: windowHeight / 3.5),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
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
                      _randomNumber,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20,
                        letterSpacing:
                            _randomNumber == "Roll for your number!" ? 0 : 3,
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
          ],
        ),
      ),
    );
  }
}
