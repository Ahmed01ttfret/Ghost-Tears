import 'package:confetti/confetti.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';

import '../../../logics/database.dart';
import '../../../variables.dart';
import '../but.dart';
import '../must.dart';

class Cong extends StatefulWidget {
  const Cong({Key? key}) : super(key: key);

  @override
  _CongState createState() => _CongState();
}

class _CongState extends State<Cong> {
  @override
  Widget build(BuildContext context) {
    Playing_list.clear();
    if (you_.value > aku_.value) {
      //you won
      return const You_won();
    } else {
      return const Aku_won();
    }
  }
}

class You_won extends StatefulWidget {
  const You_won({Key? key}) : super(key: key);

  @override
  _You_wonState createState() => _You_wonState();
}

class _You_wonState extends State<You_won> {
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
  }

  @override
  Widget build(BuildContext context) {
    pla();

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
                'Congratulations',
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
                        if (lust <= 12) {
                          lust= lust+1;
                          Save().Put(lust.toString(), true);
                        }
                        aku_.value = 0;
                        you_.value = 0;
                        fun.value = '';
                        Navigator.of(context).popUntil(ModalRoute.withName('/page1'));
                        Navigator.of(context).pop();
                        list=[];

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

class Aku_won extends StatefulWidget {
  const Aku_won({Key? key}) : super(key: key);

  @override
  _Aku_wonState createState() => _Aku_wonState();
}

class _Aku_wonState extends State<Aku_won> {
  late AudioPlayer player;
  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void ply() async {
    await player.setAsset('assets/images/crying-man-5927.mp3');
    player.play();
  }

  @override
  Widget build(BuildContext context) {
    ply();

    return WillPopScope(
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
        appBar: AppBar(
            title: Text(
              'You Lost',
              style: GoogleFonts.permanentMarker(
                  textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontStyle: FontStyle.italic,
                color: Colors.white,
              )),
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.deepOrangeAccent),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 500,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                child: Center(
                    child: Lottie.asset(
                        'assets/images/91726-sad-guy-is-walking.json')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    int cc=0;
                    aku_.value = 0;
                    you_.value = 0;
                    fun.value = '';
                    Navigator.of(context).popUntil(ModalRoute.withName('/page1'));


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
    );
  }
}
