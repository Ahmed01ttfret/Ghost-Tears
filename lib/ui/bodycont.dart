
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:ghost_game_tears/logics/database.dart';

import 'package:ghost_game_tears/ui/secScreen/MenuScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave_transition/wave_transition.dart';

import '../logics/audioplay.dart';
import 'package:just_audio/just_audio.dart';

var song=Long();

class ImageTap extends StatefulWidget {
  const ImageTap({Key? key}) : super(key: key);

  @override
  _ImageTapState createState() => _ImageTapState();


}

class _ImageTapState extends State<ImageTap> {
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

   //LongPlay('images/afro-countdown-109083.mp3');
    song.playing('images/afro-countdown-109083.mp3');


    return SizedBox(


      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Image (image: AssetImage ('assets/images/ei_1656318529150-removebg-preview.png',

          )),
          DefaultTextStyle(
            style: const TextStyle(
              fontSize: 25,
              color: Colors.black,
              shadows: [
                Shadow(
                  blurRadius: 7.0,
                  color: Colors.white,
                  offset: Offset(0, 0)
                )
              ]
            ),
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                FlickerAnimatedText('Tap To Continue',
                    textStyle: GoogleFonts.permanentMarker()


                ),
                FlickerAnimatedText('Tap To Continue',
                    textStyle: GoogleFonts.permanentMarker()
                ),
                FlickerAnimatedText('Tap To Continue',
                    textStyle: GoogleFonts.permanentMarker()
                ),
              ],
              onTap: ()async{
                  if(await Save().set('song')){
                    await player.setAsset('assets/images/success-1-6297.mp3');
                    player.play();
                  }
                  if(await Save().seter('progress')==0){
                    Save().sets('progress', 20);
                  }


                  Navigator.push(
                      context,
                      WaveTransition(child: const MenuScreen(),
                          center: const FractionalOffset(0.90,0.90),
                          duration: const Duration(milliseconds: 3000)
                      )
                  );

              },
            ),
          )




        ],
      ),
    );
  }
}
