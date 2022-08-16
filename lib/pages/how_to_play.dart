import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // for copy to clipboard
import 'dart:math';

import 'package:url_launcher/url_launcher.dart';

class HowToPlayPage extends StatefulWidget {
  const HowToPlayPage({super.key});

  @override
  State<HowToPlayPage> createState() => _HowToPlayPageState();
}

class _HowToPlayPageState extends State<HowToPlayPage> {
  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: const Text("4-chan Roller")),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Text(
                "Let's start from the top! If you're playing the game on WhatsApp"
                " or any other social media platform, then your steps will be as follows:\n"
                "Step 1: Open the app.\nStep 2: Press the roll button.\nStep 3: Screenshot "
                "(or long press the number to copy) your result. \nStep 4: Send it into the chat."
                "\n\nHow the game works: You will see a bunch of numbers on the image you're rolling"
                " to, these numbers represents the numbers you roll, usually the LAST few numbers, "
                "so from right TO left. See the example roll below:\n",
                style: TextStyle(fontSize: 16),
              ),
              Image.asset("assets/images/roll-example.png"),
              const Text(
                "\nThe below image examlple is a very basic game. But there are 2 key words "
                "that you might not understand yet, DUBS and TRIPS. DUBS are if the last"
                " 2 digets are te same number, ie. 123456788 or 124512500. TRIPS have the same"
                " concept, but now the last 3 are the same value. Quads (last 4) and higher do not apply for "
                "this game, so if you throw 098342222 will be the same as rolling trips."
                "\n\nLet's play a game!\n",
                style: TextStyle(fontSize: 16),
              ),
              Image.asset("assets/images/game-example.jpg"),
              Image.asset("assets/images/roll-example.png"),
              const Text(
                "\nHere we rolled a 0 (last digit) so I get the Cartoon GF. I wanted the thicc Goth GF... Better luck next time, "
                "since unless specified in the image, we are not alowed to re-roll for a better gf :(\n\nLet's for a second say that "
                "I rolled TRIPS:\n",
                style: TextStyle(fontSize: 16),
              ),
              Image.asset("assets/images/trips-example.png"),
              const Text(
                "\nIn this case the game image says that I get all the GFs if I roll trips.\n\nAs simple as that! The game really"
                " is that easy!",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              MaterialButton(
                onPressed: () async {
                  final Uri url = Uri.parse(
                    'https://www.youtube.com/stevesteacher',
                  );

                  if (!await launchUrl(
                    url,
                    mode: LaunchMode.externalApplication,
                  )) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Could not open the YouTube app"),
                        duration: Duration(seconds: 5),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/youtube-logo.png",
                      width: 80,
                    ),
                    const Text(
                      "Steve's teacher",
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              MaterialButton(
                onPressed: () async {
                  final Uri url = Uri.parse(
                    'https://github.com/WeebNetsu/4chan-roller',
                  );

                  if (!await launchUrl(
                    url,
                    mode: LaunchMode.externalApplication,
                  )) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Could not open GitHub"),
                        duration: Duration(seconds: 5),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/github-logo.png",
                      width: 55,
                    ),
                    const Text(
                      "\tSource Code",
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ]),
    );
  }
}
