

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghost_game_tears/variables.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:wave_transition/wave_transition.dart';

import '../logics/database.dart';
import '../ui/playingScreen/but.dart';
import '../ui/txt.dart';
import 'TwoplerStart.dart';

class TwoBody extends StatefulWidget {
  const TwoBody({Key? key}) : super(key: key);

  @override
  _TwoBodyState createState() => _TwoBodyState();
}

class _TwoBodyState extends State<TwoBody> with TickerProviderStateMixin{
  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=AnimationController(vsync:this);
    _controller.duration=const Duration(seconds: 1);
    _controller.addStatusListener((status){
      if(status==AnimationStatus.completed){
        _controller.forward(from: 0);}
    });
    _controller.addListener(() {
      setState(() {

      });
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400,
        height: 600,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              offset: Offset(1,1),blurRadius: 3,color: Colors.black,
            )
          ],
          gradient: SweepGradient(
            startAngle: 4,
            colors: const [Colors.orangeAccent,Colors.redAccent],
            transform: GradientRotation(_controller.value*6)
          )
        ),
        child: Child(),
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(10),
      )
    );
  }
}


class Child extends StatefulWidget {
  const Child({Key? key}) : super(key: key);

  @override
  _ChildState createState() => _ChildState();
}

class _ChildState extends State<Child> {
  final fog=TextEditingController();
  final smog=TextEditingController();
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
    return Column(

      children: [
      Typing('Enter Player Name'),
        const SizedBox(
          height: 100,
        ),
        TextField(
          autofocus: true,
          controller: fog,
          textInputAction: TextInputAction.done,
          cursorColor: Colors.pink,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.pink,width: 3)
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.pink,width: 3)
            ),

            labelText: 'Name of player 1',
              labelStyle: GoogleFonts.permanentMarker(color: Colors.pink,),
            prefixIcon: const Icon(Icons.eleven_mp_sharp,color: Colors.pink,),

          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          controller: smog,

          textInputAction: TextInputAction.done,

          decoration:  InputDecoration(
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.pink,width: 3)
            ),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.pink,width: 3)
            ),

            labelText: 'Name of player 2',
            labelStyle: GoogleFonts.permanentMarker(color: Colors.pink),
            prefixIcon: const Icon(Icons.eleven_mp_sharp,
            color: Colors.pink,),

          )
        ),
        const SizedBox(
          height: 70,
        ),
        ElevatedButton(onPressed: ()async{
          if(fog.text.isNotEmpty&&smog.text.isNotEmpty){
            first_name=fog.text;
            second_name=smog.text;
            info.value='$first_name start';
            if(await Save().set('song')){
              await player.setAsset('assets/images/success-1-6297.mp3');
              player.play();
            }
            list=[];
            Navigator.push(
                context,
                WaveTransition(child: const TwoplaerScreen(),
                    center: const FractionalOffset(0.90,0.90),
                    duration: const Duration(milliseconds: 3000)
                )
            );
          }else{
            if(await Save().set('song')){
              await player.setAsset('assets/images/success-1-6297.mp3');
              player.play();
            }
            MotionToast.error(
              title:Text('Provide the name of the players',
              style: GoogleFonts.permanentMarker()),
              description: Text('It is required',
                  style: GoogleFonts.permanentMarker()
              ),
              animationType: AnimationType.fromLeft,
            ).show(context);

          }
        },
            child: Text("play",
            style:GoogleFonts.permanentMarker()),
        style: ElevatedButton.styleFrom(

          padding: const EdgeInsets.fromLTRB(50, 15, 50, 15),
          primary: Colors.pink,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18)
          )
            
        ),)

  ],    );
    }
}
