


import 'package:flutter/material.dart';
import 'package:ghost_game_tears/ui/HomeBody.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.pink,
              Colors.red
            ],
              begin: Alignment.centerRight,
              end: Alignment.bottomLeft
          )
        ),
          child: const HomeBodyCode())

    );
  }
}

