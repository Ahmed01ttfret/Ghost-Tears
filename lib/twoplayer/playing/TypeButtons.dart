import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ghost_game_tears/set/Data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:wave_transition/wave_transition.dart';

import '../../logics/logics.dart';
import '../../ui/playingScreen/but.dart';
import '../../ui/playingScreen/must.dart';
import '../../ui/txt.dart';
import '../../variables.dart';
import 'congrat.dart';

String who(){
  if(first_start){
    return "it's $first_name 's turn";
  }else{
    return "it's $second_name 's turn";
  }
}

class TypeButtons extends StatefulWidget {
  const TypeButtons({Key? key}) : super(key: key);



  @override
  _TypeButtonsState createState() => _TypeButtonsState();
}

class _TypeButtonsState extends State<TypeButtons> {
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

  var tim = Timer.periodic(const Duration(seconds: 1), (tim) {
  if (progress.value >= 1) {

  progress.value--;
  }else{
  //

  tim.cancel();

  if(first_start&&fun.value.length.isEven){
  //first make late
  // Pop('Time Up',
  // '$first_name your time is up');
  second_point.value=second_point.value+1;
  info.value='$second_name start';
  first_start=false;
  second_start=true;
  }else if(first_start&&fun.value.length.isOdd){
  // second make late
  // Pop('Time Up',
  // '$second_name Your time is up');
  first_point.value=first_point.value+1;
  first_start=true;
  second_start=false;
  info.value='$first_name start';
  }else if(second_start&&fun.value.length.isEven){
  //second make late
  first_start=true;
  second_start=false;
  info.value='$first_name start';
  // Pop('Time Up',
  // '$second_name Your time is up');
  first_point.value=first_point.value+1;
  }else{
  // first make late
  // Pop('Time Up',
  // '$first_name your time is up');
  second_point.value=second_point.value+1;
  first_start=false;
  second_start=true;
  info.value='$second_start start';
  }

  letter.value=[];
  for(String x in list){

    letter.value.add(x.substring(0,1));
  }
  fun.value='';
  ints=[];

  }


  });


  Future Pops(String title ,String body)async{


    return showDialog(
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


  void chg(){
    if(first_point.value==2||second_point.value==2){
      Navigator.push(
          context,
          WaveTransition(child: const Congratulations(),
              center: const FractionalOffset(0.90,0.90),
              duration: const Duration(milliseconds: 3000)
          )
      );
    }
  }


  Future Pop(String title ,String body)async{
    await player.setAsset('assets/images/buzzer-or-wrong-answer-20582.mp3');
    player.play();
    return showDialog(
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


  Widget Button(String text) {
    return GestureDetector(
      onTap: () async{
        Pressed();
        fun.value=fun.value+text;

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
  void reset(){
    letter.value=[];
    for(String x in list){

      letter.value.add(x.substring(0,1));
    }
    fun.value='';
    ints=[];
  }

  void Pressed()async{
    tim.cancel();
    progress.value==-3;

    List mid=[];
    await player.setAsset('assets/images/correct-choice-43861.mp3');
    player.play();

    int len=fun.value.length;


   if(ints.isEmpty){
     for(String x in list){

       if(fun.value==x.substring(0,len)){
         mid.add(x);

       }
   }

    }else{
     for(String x in ints){
       if(fun.value==x.substring(0,len)){
         mid.add(x);
       }
     }

   }


    if(mid.isEmpty){
      //wrong speing
      reset();
      if(first_start&&len.isEven){
        first_point.value=first_point.value+1;
        await Pop('Wrong Spelling',
            '$second_name you made a wrong spelling so $first_name has gain a point');

        first_start=true;
        second_start=false;
        info.value='$first_name it is your turn';
        //letters must change here maybe a function
      }else if(first_start&&len.isOdd){
        second_point.value=second_point.value+1;

        await Pop('Wrong Spelling',
            '$first_name you made a wrong spelling so $second_name has gain a point');
        first_start=false;
        second_start=true;
        info.value='$second_name it is your turn';
        //change letter
      }else if(second_start&&len.isEven){
        second_point.value=second_point.value+1;

        await Pop('Wrong Spelling',
            '$first_name you made a wrong spelling so $second_name has gain a point');
        first_start=false;
        second_start=true;
        info.value='$second_name it is your turn';
      }else{
        first_point.value=first_point.value+1;
        await Pop('Wrong Spelling',
            '$second_name you made a wrong spelling so $first_name has gain a point');

        first_start=true;
        second_start=false;
        info.value='$first_name it is your turn';
      }
      chg();

    }else{

      // crrect spelling

      if(finish(mid, fun.value)){
        //finish spelling

        mid=[];
        list.remove(fun.value);
        reset();
        if(first_start&&len.isEven){
          // second win
          fun.value='';
          first_start=false;
          second_start=true;
          second_point.value=second_point.value+1;
          await Pops('Congratulations',
              '$second_name entered the last letter of a correctly spelt word. A point is gained');
          info.value='$second_name it is your turn';
        }else if(first_start&&len.isOdd){
          //first win
          fun.value='';
          first_point.value=first_point.value+1;
          first_start=true;
          second_start=false;
          info.value='$first_name it is your turn';
          await Pops('Congratulations',
              '$first_name entered the last letter of a correctly spelt word. A point is gained');
        }else if(second_start&&len.isEven){
          //first win
          fun.value='';
          first_point.value=first_point.value+1;
          first_start=true;
          second_start=false;
          info.value='$first_name it is your turn';
          await Pops('Congratulations',
              '$first_name entered the last letter of a correctly spelt word. A point is gained');
        }else{
          //second win
          fun.value='';
          first_start=false;
          second_start=true;
          second_point.value=second_point.value+1;
          await Pops('Congratulations',
              '$second_name entered the last letter of a correctly spelt word. A point is gained');
          info.value='$second_name it is your turn';
        }
        chg();
      }else{
        // continue spelling
        if(first_start&&fun.value.length.isEven){
          info.value='$first_name it is your turn';
        }else if(first_start&&fun.value.length.isOdd){
          info.value='$second_name it is your turn';
        }else if(second_start&&fun.value.length.isEven){
          info.value='$second_name it is your turn';
        }else{
          info.value='$first_name it is your turn';
        }
        letter.value=[];
        List jj=[];
        len=fun.value.length;

        for(String x in mid){

          jj.add(x.substring(len,len+1));
        }
        letter.value=jj;

        ints=mid;
        progress.value=times;
        tim = Timer.periodic(const Duration(seconds: 1), (tim) {
          if (progress.value >= 1) {

            progress.value--;
          }else if(progress.value==0){
            tim.cancel();
            //

            if(first_start&&fun.value.length.isEven){
              //first make late
              Pop('Time Up',
              '$first_name your time is up');
              second_point.value=second_point.value+1;
              info.value='$second_name start';
              first_start=false;
              second_start=true;
            }else if(first_start&&fun.value.length.isOdd){
              // second make late
              Pop('Time Up',
              '$second_name Your time is up');
              first_point.value=first_point.value+1;
              first_start=true;
              second_start=false;
              info.value='$first_name start';
            }else if(second_start&&fun.value.length.isEven){
              //second make late
              first_start=true;
              second_start=false;
              info.value='$first_name start';
              Pop('Time Up',
              '$second_name Your time is up');
              first_point.value=first_point.value+1;
            }else{
              // first make late
              Pop('Time Up',
               '$first_name your time is up');
              second_point.value=second_point.value+1;
              first_start=false;
              second_start=true;
              info.value='$second_start start';
            }
            reset();
            chg();




          }

        });
      }
    }

    // game logic here
  }
  @override
  Widget build(BuildContext context) {

    return ValueListenableBuilder(
        valueListenable: letter,
        builder: (BuildContext context, List lists, child) {
          List move;
          int l = 1;

          int val = lust;
          val = (val + 3);
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
