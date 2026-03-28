

import 'package:flutter/material.dart';

import 'bodygame.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({Key? key}) : super(key: key);

  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [

                    Color(0xfff4b6c2),
                    Colors.transparent,

                  ],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft
              )
          ),

          child: GameBody()),
    );
  }
}
