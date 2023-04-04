import 'dart:convert';

import 'package:quickalert/quickalert.dart';
import 'package:api/Quran/model.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Quran extends StatefulWidget {
  const Quran({super.key});

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  final play = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Testing")),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  play.play(AssetSource('assets/audio/2pac-509.mp3'));
                },
                child: Text("play")),
            ElevatedButton(
                onPressed: () {
                  play.pause();
                },
                child: Text("pause")),

            ElevatedButton(
                onPressed: () {
                  play.resume();
                },
                child: Text("resume")),
            //         })),
          ],
        ),
      ),
    );
  }
}

class customRow extends StatelessWidget {
  customRow({required this.name, super.key});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name,
          style: TextStyle(fontSize: 19),
        ),
      ],
    );
  }
}

class Quick {
  static costumSnackbar(
      String title, BuildContext context, QuickAlertType name) {
    return QuickAlert.show(
      context: context,
      type: name,
      title: title,
      backgroundColor: Colors.grey.shade700,
      titleColor: Colors.white,
    );
  }
}
