
import 'package:flutter/material.dart';
import 'package:ghost_game_tears/twoplayer/playing/ui.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../ui/playingScreen/Score.dart';
import '../../ui/playingScreen/but.dart';
import '../../ui/playingScreen/uiplay.dart';
import '../../variables.dart';
import 'TypeButtons.dart';

class Plays extends StatefulWidget {
  const Plays({Key? key}) : super(key: key);

  @override
  _PlaysState createState() => _PlaysState();
}

class _PlaysState extends State<Plays> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Column(
        children: const [
          //Hmm(),
          TopStart(),
          Information(),
          Timmer(),
          ShowText(),
          TypeButtons()




        ],
      )
    );
  }
}



class Information extends StatefulWidget {
  const Information({Key? key}) : super(key: key);

  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: info,
        builder: (BuildContext context, String countvalue, child){
          return Center(
            child: Text(countvalue,
              style: GoogleFonts.mali(
                color: Colors.white,
              ),
            ),
          );
        }

    );
  }
}
