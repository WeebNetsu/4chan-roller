import 'package:flutter/material.dart';
import 'package:four_chan_roller/pages/home.dart';
import 'package:four_chan_roller/pages/how_to_play.dart';

Map<String, Widget Function(BuildContext)> routes = {
  "/": (context) => const HomePage(),
  "/htp": (context) => const HowToPlayPage(),
};
