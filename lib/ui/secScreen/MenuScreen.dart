
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'menubody.dart';


class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        bool x=false;
        showDialog(context: context, builder: (context)=>AlertDialog(
          title: Text("Are You Sure?",
          style: GoogleFonts.permanentMarker(),
          ),
          content: Text("Are You Sure You Want to Quit this game?",
          style: GoogleFonts.mali(),),
          backgroundColor: Colors.lime,
          actions: [
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            },
                style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlueAccent,
                    padding: const EdgeInsets.all(8.0)
                ),
                child: Text('Cancel',
                style: GoogleFonts.mali(),)),
            ElevatedButton(onPressed: (){
              if(Platform.isAndroid){
                SystemNavigator.pop();
              }else if(Platform.isIOS){
                exit(0);
              }
            },
                style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    padding: const EdgeInsets.all(8.0)
                ),
                child: Text('Quit',
                style: GoogleFonts.mali(),))
          ],
        ));

        return x;
      },
      child: Scaffold(

        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color(0xfff4b6c2),
                      Colors.purpleAccent,

                    ],
                    begin: Alignment.centerRight,
                    end: Alignment.bottomLeft
                )
            ),
            child: const MenuBody()),
      ),
    );
  }
}
