

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghost_game_tears/ui/playingScreen/but.dart';
import 'package:ghost_game_tears/variables.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../ui/txt.dart';

class TopStart extends StatefulWidget {
  const TopStart({Key? key}) : super(key: key);

  @override
  _TopStartState createState() => _TopStartState();
}

class _TopStartState extends State<TopStart> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: custom('↫')),
        const Expanded(child: rows())

      ],
    );
  }
}


class rows extends StatefulWidget {
  const rows({Key? key}) : super(key: key);

  @override
  _rowsState createState() => _rowsState();
}

class _rowsState extends State<rows> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ValueListenableBuilder(
              valueListenable: first_point,
              builder: (BuildContext context, int countvalue, child){
                return Text('$first_name : $countvalue',
                  style: GoogleFonts.mali(
                    color: Colors.black,
                    fontSize: 25
                  ),
                );
              }

          ),
          ValueListenableBuilder(
              valueListenable: second_point,
              builder: (BuildContext context, int countvalue, child){
                return Text('$second_name : $countvalue',
                  style: GoogleFonts.mali(
                    color: Colors.black,
                    fontSize: 25
                  ),
                );
              }

          ),
        ],
      ),
    );
  }
}
