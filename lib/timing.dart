import 'dart:async';

import 'package:async/async.dart';
import 'package:ghost_game_tears/twoplayer/playing/ui.dart';

import 'package:ghost_game_tears/ui/playingScreen/but.dart';
import 'package:ghost_game_tears/variables.dart';

class Timing{

  final timer=RestartableTimer(
    const Duration(seconds: 1),
      (){
        if (progress.value >= 1) {

          progress.value--;

        }else{



        }
      }
  );

  void Reset(){
    timer.reset();
  }

  void Stop(){
    timer.cancel();
  }

}
