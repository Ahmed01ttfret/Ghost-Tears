import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghost_game_tears/logics/logics.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:wave_transition/wave_transition.dart';
import '../../logics/database.dart';
import '../../set/Data.dart';
import '../../variables.dart';
import '../Rules.dart';
import '../txt.dart';
import 'package:just_audio/just_audio.dart';
import 'but.dart';
import 'congratulationScreen/Congrate.dart';
import 'must.dart';



class Timmer extends StatefulWidget {
  const Timmer({Key? key}) : super(key: key);

  @override
  _TimmerState createState() => _TimmerState();
}

class _TimmerState extends State<Timmer> {


  @override
  Widget build(BuildContext context) {
    progress.value=times;
    return Padding(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: ValueListenableBuilder(
            valueListenable: progress,
            builder: (BuildContext context, double amount, child) {
              return SizedBox(
                  child: Center(
                    child: Text('Time: $amount',
                    style: GoogleFonts.mali(
                      color: Colors.black87,
                      fontSize: 15
                    ),
                    )
                  )

                  // child: LiquidLinearProgressIndicator(
                  //   value: convert(amount),
                  //   valueColor: const AlwaysStoppedAnimation(Colors.pink),
                  //   backgroundColor: Colors.white,
                  //   borderRadius: 10,
                  //   borderWidth: 2,
                  //   borderColor: Colors.white,
                  //   direction: Axis.horizontal,
                  //   center: customs('timer'),
                  //
                  // )
                  );
            }));
  }
}


String text = 'here';

class ShowText extends StatefulWidget {
  const ShowText({Key? key}) : super(key: key);

  @override
  _ShowTextState createState() => _ShowTextState();
}

class _ShowTextState extends State<ShowText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xfffe4a49)),
              borderRadius: BorderRadius.circular(10.0),
            ),
            height: 50,
            width: double.infinity,
            child: ValueListenableBuilder(
              valueListenable: fun,
              builder: (BuildContext context, String countvalue, child) {
                return Center(child: Typing(countvalue));
              },
            ),
          ),
        ));
  }
}

class Keys extends StatefulWidget {
  const Keys({Key? key}) : super(key: key);

  @override
  _KeysState createState() => _KeysState();
}

class _KeysState extends State<Keys> {
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
  void change(){
    if(you_.value>=15||aku_.value>=15){
      Navigator.push(
          context,
          WaveTransition(child: const Cong(),
              center: const FractionalOffset(0.90,0.90),
              duration: const Duration(milliseconds: 3000)
          )
      );
    }
  }
  void showR(String title, String body) async{
    await player.setAsset('assets/images/buzzer-or-wrong-answer-20582.mp3');
    player.play();
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: customs(title),
          content: Text(
            body,
            style: GoogleFonts.mali(fontSize: 20),
          ),
          elevation: 10.0,
          backgroundColor: Colors.deepOrangeAccent,
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Okay",
                  style: GoogleFonts.permanentMarker(
                    color:Colors.black,
                  ),
                ))
          ],
        ));
  }
  //progress.value=times;
  var timer = Timer.periodic(const Duration(seconds: 1), (timer) {
    if (progress.value >= 1) {

      progress.value--;
    }else{
      timer.cancel();
      //


      reset_one();
    }

  });



  void showresult(String title, String body) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: customs(title),
              content: Text(
                body,
                style: GoogleFonts.mali(fontSize: 20),
              ),
              elevation: 10.0,
              backgroundColor: Colors.deepOrangeAccent,
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Okay",
                      style: GoogleFonts.permanentMarker(
                        color:Colors.black,
                      ),
                    ))
              ],
            ));
  }


  void Pressed(String x) async{
    timer.cancel();
    //play audio
    await player.setAsset('assets/images/correct-choice-43861.mp3');
    player.play();
    fun.value = fun.value + x;
    info.value = "It's Aku's Turn";
    checking();
  }

  void aku(List l) async {
    List n = [];
    var wrong = await Save().cat();
    //after slepping
    await Future.delayed(const Duration(seconds: 2));
    //probability

    //trow
    for (String x in l) {
      n.add(x.substring(fun.value.length, fun.value.length + 1));
    }
    n.shuffle();

    if (probability(wrong!)) {
      alphabet.shuffle();
      fun.value = fun.value + alphabet[0];
    } else {
      fun.value = fun.value + n[0];
    }
    await Future.delayed(const Duration(milliseconds: 2));
    List dd = [];
    //checkin if aku is wrong
    for (String f in Playing_list) {
      if (fun.value != f.substring(0, fun.value.length)) {
        dd.add(f);
      }
    }
    for (String x in dd) {
      if (Playing_list.contains(x)) {
        Playing_list.remove(x);
      }
    }
    if (Playing_list.isEmpty) {
      print(Playing_list);
      //aku is wrong
      info.value = 'aku eti';
      showresult('Congratulations',
          'Aku made a wrong spelling .You earn a point ');
      reset_two();
      change();
      fun.value = '';
    } else {
      //correct
      print(Playing_list);
      if (finish(Playing_list, fun.value)) {
        // correct spelling
        showresult('Lost a point',
            'Aku Entered the last letter of a correctly spelt word. He earns a point');
        info.value = 'correct aku';
        list.remove(fun.value);
        use.add(fun.value);
        Playing_list.clear();
        reset_one();
        change();
      } else {
        //continue
        List kk = [];
        for (String x in Playing_list) {
          kk.add(x.substring(fun.value.length, fun.value.length + 1));
        }
        letter.value = kk;
        progress.value=times;
        timer = Timer.periodic(const Duration(seconds: 1), (timer) {
          if(progress.value>=1){
            progress.value--;
          }else{
            timer.cancel();

            showR('Time up', 'Your time is up. Aku has gained a point');
            Playing_list.clear();
            reset_one();
            change();
          }

        });


      }
    }
  }

  void checking() async {
    List tt = [];
    //first phase checking
    if (fun.value.length <= 1) {
      for (String x in list) {
        if (fun.value == x.substring(0, fun.value.length)) {
          Playing_list.add(x);
        }
      }
    } else {
      if(Playing_list.isEmpty){
        for (String x in list) {
          if (fun.value == x.substring(0, fun.value.length)) {
            Playing_list.add(x);
          }
        }
      }else{

        for (String x in Playing_list) {
          if (fun.value != x.substring(0, fun.value.length)) {
            tt.add(x);
          }
        }
      }
    }

    //checkin 2
    //removing tt from playing list
    for (String x in tt) {
      if (Playing_list.contains(x)) {
        Playing_list.remove(x);
      }
    }
    if (Playing_list.isEmpty) {
      info.value = 'Wrong spelling';
      await player.setAsset('assets/images/buzzer-or-wrong-answer-20582.mp3');
      player.play();
      showresult('Wrong Spelling',
          'You made a wrong spelling. what your are spelling does not exist');
      Playing_list.clear();
      reset_one();
      change();
    } else {
      info.value = 'correct';

      //checking if he has finish spelling
      if (finish(Playing_list, fun.value)) {
        //done speling
        info.value = 'done';
        showresult('Congratulations',
            'You Entered the last letter of a completly spelt word. You earn a point');
        list.remove(fun.value);
        use.add(fun.value);
        Playing_list.clear();
        reset_two();
        change();
      } else {
        // not finish
        info.value = 'continue';
        aku(Playing_list);
      }
    }
  }

  Widget Button(String text) {
    return GestureDetector(
      onTap: () {
        Pressed(text);
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: const Color(0xfffe4a49),
            borderRadius: BorderRadius.circular(10.0)),
        child: Center(
            child: Text(
          text,
          style: GoogleFonts.permanentMarker(fontSize: 30),
        )),
      ),
    );
  }

  Future<int> conditions() async {
    var x = await Save().cat();
    return x!;
  }

  Widget play() {
    return FutureBuilder<int>(
      future: conditions(),
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const CircularProgressIndicator();
          default:
            if (snapshot.hasError) {
              return const Text('');
            } else {
              return ValueListenableBuilder(
                  valueListenable: letter,
                  builder: (BuildContext context, List lists, child) {
                    List move;
                    int l = 1;

                    int? val = snapshot.data;
                    val = (val! + 3);
                    if (lists.length >val) {
                      lists.shuffle();
                      move = Sample(lists, val);
                      move = hard(move);
                    }else if(lists.length==val){
                      lists.shuffle();
                      move=hard(lists);
                    }
                    else {
                      int r = val - lists.length;
                      List n = Sample(alphabet, r);
                      move = lists;
                      move = move + n;
                      move.shuffle();
                    }

                    List<Widget> h = [];

                    while (l <= val) {
                      int k = l - 1;
                      String x = move[k];
                      h.add(Button(x));
                      l++;
                    }
                    return ResponsiveGridList(
                      horizontalGridSpacing: 10,
                      horizontalGridMargin: 10,
                      verticalGridMargin: 10,
                      verticalGridSpacing: 10,
                      minItemWidth: 40,
                      minItemsPerRow: 3,
                      maxItemsPerRow: 5,
                      shrinkWrap: true,
                      children: h,
                    );
                  });
            }
        }
      },
    );
  }

  int l = 1;

  late int level = 0;

  List<Widget> myList = [];
  List<Widget> h() {
    while (l <= level) {
      myList.add(Button('$l'));
      l++;
    }
    return myList;
  }

  @override
  Widget build(BuildContext context) {
    fun.value = '';
    return SizedBox(height: 400, child: play());
  }
}

class Foot extends StatefulWidget {
  const Foot({Key? key}) : super(key: key);

  @override
  _FootState createState() => _FootState();
}

class _FootState extends State<Foot> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Center(child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.transparent
                    ],


                )
            ),
            child: ElevatedButton(
                style :ElevatedButton.styleFrom(
                  primary: Colors.red
                ),
                onPressed: () async {
                  Navigator.push(
                      context,
                      WaveTransition(child: const Rules(),
                          center: const FractionalOffset(0.90,0.90),

                          duration: const Duration(milliseconds: 3000)
                      )
                  );
                }, child: customs("rules")),
          )),

        ],
      ),
    );
  }
}

Widget Body(){
  if(use.isEmpty){
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
        child: customs('No Completely spelt word'),
      ),
    );
  }else{
    List<Widget> kofi=[];
    for(String x in use){
      kofi.add(ListTile(
        title: customs(x),
      ));
    }
    return ListView.builder(
      itemCount: use.length,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context,index){
        return ListTile(
          title: customs(use[index]),
        );
      },


    );
  }
}