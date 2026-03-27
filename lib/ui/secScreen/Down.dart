import 'package:flutter/material.dart';
import 'package:ghost_game_tears/ui/Rules.dart';
import 'package:just_audio/just_audio.dart';
import 'package:wave_transition/wave_transition.dart';

import '../../logics/database.dart';
import '../../set/Settings.dart';
import '../../twoplayer/StartScreen.dart';
import '../selectleve/seletLevel.dart';
import '../txt.dart';

class Options extends StatefulWidget {
  const Options({Key? key}) : super(key: key);

  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
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
    return Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: Column(
            children: [
              TextButton(onPressed: ()async{
                if(await Save().set('song')){
                  await player.setAsset('assets/images/success-1-6297.mp3');
                  player.play();
                }

                Navigator.push(
                    context,
                    WaveTransition(child: const SelectLevel(),
                        center: const FractionalOffset(0.90,0.90),
                        settings: const RouteSettings(name: '/page1'),
                        duration: const Duration(milliseconds: 3000)
                    )
                );
              },
                  child: customs('Single Player Mode')),
              TextButton(onPressed: ()async{
                if(await Save().set('song')){
                  await player.setAsset('assets/images/success-1-6297.mp3');
                  player.play();
                }
                Navigator.push(
                    context,
                    WaveTransition(child: const StartUp(),
                        center: const FractionalOffset(0.90,0.90),
                        settings: const RouteSettings(name: '/page1'),
                        duration: const Duration(milliseconds: 3000)
                    )
                );
              },
                  child: customs('Two Player Mode')),
              TextButton(onPressed: (){},
                  child: customs('Remove ads')),
              TextButton(onPressed: ()async{
                if(await Save().set('song')){
                  await player.setAsset('assets/images/success-1-6297.mp3');
                  player.play();
                }
                Navigator.push(
                    context,
                    WaveTransition(child: const Settings(),
                        center: const FractionalOffset(0.90,0.90),

                        duration: const Duration(milliseconds: 3000)
                    )
                );
              },
                  child: customs('settings')),
              TextButton(onPressed: ()async{
                if(await Save().set('song')){
                  await player.setAsset('assets/images/success-1-6297.mp3');
                  player.play();
                }
                Navigator.push(
                    context,
                    WaveTransition(child: const Rules(),
                        center: const FractionalOffset(0.90,0.90),

                        duration: const Duration(milliseconds: 3000)
                    )
                );
              },
                  child: customs('Rules')),
            ],
          ),
        ));
  }
}






class Adds extends StatefulWidget {
  const Adds({Key? key}) : super(key: key);

  @override
  _AddsState createState() => _AddsState();
}

class _AddsState extends State<Adds> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 50, 0, 80),
      child: Container(
        color: Colors.blue,
        height: 70,
      ),
    );
  }
}
