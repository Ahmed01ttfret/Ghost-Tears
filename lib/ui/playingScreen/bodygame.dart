import 'package:flutter/material.dart';
import 'package:ghost_game_tears/ui/playingScreen/uiplay.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Score.dart';
import 'but.dart';

class GameBody extends StatefulWidget {
  const GameBody({Key? key}) : super(key: key);

  @override
  _GameBodyState createState() => _GameBodyState();
}

class _GameBodyState extends State<GameBody> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //const ScoreBoard(),
        const Hmm(),
        const Timmer(),
        const ShowText(),
        ValueListenableBuilder(
          valueListenable: info,
        builder: (BuildContext context, String countvalue, child){
            return Text(countvalue,
              style: GoogleFonts.mali(
                color: Colors.redAccent,
              ),
            );
    }

        ),
        const Keys(),
        const Foot()
      ],
    );
  }
}
