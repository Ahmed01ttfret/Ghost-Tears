

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ghost_game_tears/ui/bodycont.dart';
import 'package:ghost_game_tears/ui/playingScreen/but.dart';
import 'package:google_fonts/google_fonts.dart';

import '../logics/database.dart';
import 'Data.dart';

class SetBody extends StatefulWidget {
  const SetBody({Key? key}) : super(key: key);

  @override
  State<SetBody> createState() => _SetBodyState();
}

class _SetBodyState extends State<SetBody> {



  @override
  Widget build(BuildContext context) {
    double h=progress.value;
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Center(

              child: Text('Settings',
              style: GoogleFonts.permanentMarker(
                fontSize: 30
              ),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 80,right: 80),
            child: Center(
              child: Column(

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Music',style: GoogleFonts.permanentMarker(),),
                        FutureBuilder<bool>(

                          future: Save().set('music'),
                          builder: (BuildContext context, AsyncSnapshot<bool> snapshot){
                            IconData xx=snapshot.data!?music_1:music_2;
                          switch(snapshot.connectionState){
                          case ConnectionState.waiting:
                          return const CircularProgressIndicator();
                          default:
                          if (snapshot.hasError){
                          return const Text('');
                          }else{
                          return IconButton(onPressed: ()async{

                            if(snapshot.data!){
                              setState(() {
                                Save().Put("music", false);
                                xx=music_2;
                                song.Stop();
                              });
                            }else{
                              setState(() {
                                Save().del('music');
                                xx=music_1;
                                song.playing('images/afro-countdown-109083.mp3');
                              });

                            }

                          },


                              icon: Icon(xx));
                          }
                          }

                        },
                        )

                    ],
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Sound Fx',style: GoogleFonts.permanentMarker(),),
                      FutureBuilder<bool>(

                        future: Save().set('sound'),
                        builder: (BuildContext context, AsyncSnapshot<bool> snapshot){
                          IconData xx=snapshot.data!?sound_1:sound_2;
                          switch(snapshot.connectionState){
                            case ConnectionState.waiting:
                              return const CircularProgressIndicator();
                            default:
                              if (snapshot.hasError){
                                return const Text('');
                              }else{
                                return IconButton(onPressed: ()async{

                                  if(snapshot.data!){
                                    setState(() {
                                      Save().Put("sound", false);
                                      xx=sound_2;
                                    });
                                  }else{
                                    setState(() {
                                      Save().del('sound');
                                      xx=sound_1;
                                    });

                                  }

                                },


                                    icon: Icon(xx));
                              }
                          }

                        },
                      )

                    ],
                  ),



                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Text('Reset Settings',
                      style: GoogleFonts.permanentMarker(),),
                      IconButton(onPressed: (){
                        showDialog(context: context, builder: (context)=>
                        AlertDialog(

                          actions: [
                            TextButton(onPressed: (){
                              Navigator.pop(context);
                            },
                                child: Text('Cancel',
                                style: GoogleFonts.permanentMarker(
                                  color: Colors.black
                                ),)),
                            TextButton(onPressed: (){
                              Navigator.pop(context);
                              // delete every thing
                              Save().clr();
                              Save().Put('1', true);
                              Navigator.pop(context);
                              song.playing('images/afro-countdown-109083.mp3');
                            },
                                child: Text('Reset',
                                style: GoogleFonts.permanentMarker(
                                  color: Colors.red
                                ),))
                          ],
                          backgroundColor: Colors.indigo,
                          insetPadding: const EdgeInsets.fromLTRB(60, 120, 60, 120),
                          title: Text('Reset Settings',
                          style: GoogleFonts.permanentMarker(),),
                          content: Center(
                            child: Text('This will reset all progress and settings',
                            style: GoogleFonts.permanentMarker(),),
                          ),
                        ));
                      },
                          icon: Icon(Icons.delete))
                    ],
                  ),
                  const SizedBox(
                    height: 50,

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      TextButton(

                        onPressed: (){},
                        child: Text("Remove Ads",
                        style: GoogleFonts.permanentMarker(
                          color: Colors.black,
                          letterSpacing: 2
                        ),),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(

                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Timer Duration',
                          style: GoogleFonts.permanentMarker(),),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(onPressed: (){
                                if(times<40){


                                  setState(() {

                                    times=times+1;

                                  });
                                }else{
                                  //toast
                                  Fluttertoast.showToast(
                                      timeInSecForIosWeb: 3,
                                      msg: 'The maximum time is 40 sec and minimum time is 10 sec',
                                      backgroundColor: Colors.deepPurple,
                                      gravity: ToastGravity.BOTTOM);
                                }

                              },
                                  icon: const Icon(Icons.keyboard_arrow_up_rounded)),

                          Text('$times sec',
                              style: GoogleFonts.permanentMarker(),),

                              IconButton(onPressed: (){
                                if(times>10){

                                setState(() {
                                  times=times-1;

                                });
                                }else{
                                //toast

                                 Fluttertoast.showToast(
                                   timeInSecForIosWeb: 3,
                                     msg: 'The maximum time is 40 sec and minimum time is 10 sec',
                                 backgroundColor: Colors.deepPurple,
                                 gravity: ToastGravity.BOTTOM);
                                }
                              },
                                  icon: const Icon(Icons.keyboard_arrow_down_outlined)),
                            ],
                          )
                        ],
                      ),
                    ),
                  )

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
