
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:wave_transition/wave_transition.dart';

import '../ui/selectleve/Actions.dart';
import '../ui/txt.dart';
import '../variables.dart';
import 'playing/PlayingScreen.dart';

class BodyLevel extends StatefulWidget {
  const BodyLevel({Key? key}) : super(key: key);

  @override
  _BodyLevelState createState() => _BodyLevelState();
}

class _BodyLevelState extends State<BodyLevel> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TopActions(),
        DropDownSelect(),
        Leveling()

      ],
    );
  }
}


class Leveling extends StatefulWidget {
  const Leveling({Key? key}) : super(key: key);

  @override
  _LevelingState createState() => _LevelingState();
}

class _LevelingState extends State<Leveling> {
  late AudioPlayer player;
  @override
  void initState(){
    super.initState();
    player=AudioPlayer();
  }

  @override
  void dispose(){
    player.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    Widget Button(String x, int n){
      return TextButton(onPressed: ()async{
        if(list.isEmpty){
          showDialog(context: context, builder: (context)=>
          AlertDialog(
            backgroundColor: Colors.deepOrangeAccent,
            
            content: Center(
              child: Text('Select the group of words you want to use',
              style: GoogleFonts.mali(),),

            ),
            actions: [TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('Okay',
            style: GoogleFonts.permanentMarker(),))],
          ));
        }else{
          lust=n;
          await player.setAsset('assets/images/success-1-6297.mp3');
          player.play();
          Navigator.push(
              context,
              WaveTransition(child: const Plays(),
                  center: const FractionalOffset(0.90,0.90),
                  duration: const Duration(milliseconds: 3000)
              )
          );

        }
      },
          child: level(x, Colors.black));
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 30, 15, 15),

      child: SizedBox(
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button('1', 1),


                Button('2', 2),

                Button('3', 3)

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button('4', 4),
                Button('5', 5),
                Button('6', 6)

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button('7', 7),
                Button('8', 8),
                Button('9', 9),

              ],

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button('10', 10),
                Button('11', 11),
                Button('12', 12)

              ],
            ),
          ],
        ),
      ),
    );
  }
}

