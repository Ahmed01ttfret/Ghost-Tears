
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:ghost_game_tears/ui/playingScreen/but.dart';
import 'package:ghost_game_tears/variables.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';

String x='';

class Congratulations extends StatefulWidget {
  const Congratulations({Key? key}) : super(key: key);

  @override
  State<Congratulations> createState() => _CongratulationsState();
}

class _CongratulationsState extends State<Congratulations> {
  final c = ConfettiController();


  late AudioPlayer player;
  @override
  void initState() {
    c.play();
    super.initState();
    player = AudioPlayer();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void pla() async {
    await player.setAsset('assets/images/crowd-cheer-ii-6263.mp3');
    player.play();
    c.play();
  }
  @override
  Widget build(BuildContext context) {

    pla();
    if(first_point.value>second_point.value){
      x=first_name;
    }else{
      x=second_name;
    }
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        WillPopScope(
          onWillPop: () async {
            showDialog(context: context, builder: (BuildContext context){
              return AlertDialog(
                title: const Text('Press on the next button'),
                content: Text(
                  'Press on the "Next" button',
                  style: GoogleFonts.mali(),
                ),
              );
            });
            return false;
          },
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                'Congratulations to $x for wining this round',
                style: GoogleFonts.permanentMarker(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    )),
              ),
              backgroundColor: Colors.deepOrangeAccent,
              centerTitle: true,
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                    child: SizedBox(
                      height: 500,
                      child:
                      Lottie.asset('assets/images/29774-dance-party.json'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        first_point.value=0;
                        second_point.value=0;
                        Navigator.of(context).popUntil(ModalRoute.withName('/page1'));
                        Navigator.of(context).pop();


                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.deepOrangeAccent,
                          padding: const EdgeInsets.all(8.0)),
                      child: Text(
                        "Next",
                        style: GoogleFonts.permanentMarker(),
                      )),
                )
              ],
            ),
          ),
        ),
        ConfettiWidget(
          confettiController: c,
          shouldLoop: true,
          blastDirectionality: BlastDirectionality.explosive,
          emissionFrequency: 0.088,
        )
      ],
    );
  }
}
