

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../logics/database.dart';

Widget custom_text(String text){
  return Text(text,
    style: GoogleFonts.pacifico(
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 40,
        fontStyle: FontStyle.italic
      )
    ),
  );
}

//indie flower
//permanent marker
//lobster two
//mali
//

Widget customs(String text){
  return Text(text,
    style: GoogleFonts.permanentMarker(
        textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontStyle: FontStyle.italic,
          color: Colors.black,
        )
    ),
  );
}


Widget Animate(String text){
  return AnimatedTextKit(
      animatedTexts: [
        TyperAnimatedText(text,
          speed: const Duration(milliseconds: 60),

          textStyle: GoogleFonts.permanentMarker(
            fontSize: 30
          )
        )
      ],
          isRepeatingAnimation: true,

  );
}




//↫↺


Widget custom(String text){

  return Text(text,
    style: GoogleFonts.permanentMarker(
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 50,
          fontStyle: FontStyle.italic,
          color: Colors.black,
        )
    ),
  );
}



Color color=Colors.black26;

void must(String x)async{
  bool ch=await Save().Get(x);
  if(ch){
    color=Colors.black;
  }
}


Widget level(String text, Color color){

  must(text);

  return Text(text,
    style: GoogleFonts.permanentMarker(
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 50,
          fontStyle: FontStyle.italic,
          color: color,
        )
    ),
  );
}





Widget Typing(String text){
  return AnimatedTextKit(
      animatedTexts:[
        WavyAnimatedText(text,
          textStyle: GoogleFonts.permanentMarker(
            color: Colors.black,
            fontSize: 20
          )
        ),
        WavyAnimatedText(text,
          textStyle: GoogleFonts.permanentMarker(
            color: Colors.black,
            fontSize: 20,
          )
        ),
        WavyAnimatedText(text,
          textStyle: GoogleFonts.permanentMarker(
            color: Colors.black,
            fontSize: 20
          )
        ),
      ],
          isRepeatingAnimation: true,
    repeatForever: true,


  );
}


