
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Rules extends StatefulWidget {
  const Rules({Key? key}) : super(key: key);

  @override
  _RulesState createState() => _RulesState();
}

class _RulesState extends State<Rules> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Game Rules",
        style: GoogleFonts.permanentMarker(
          color: Colors.white
        ),),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text("this will be read from a txt file "*50,
          style: GoogleFonts.mali(),),
        ),
      ),
    );
  }
}
