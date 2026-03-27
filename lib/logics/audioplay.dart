

import 'package:audioplayers/audioplayers.dart';
import 'package:ghost_game_tears/logics/database.dart';
import 'package:ghost_game_tears/set/Data.dart';
//
// void LongPlay (String path)async{
//    if(await Save().set('music')){
//       final play= AudioPlayer();
//       await play.play(AssetSource(path));
//       await play.setReleaseMode(ReleaseMode.loop);
//    }
//
//
//
//
//
// }


class Long{
   final play= AudioPlayer();

   void playing(String path)async{
      if(await Save().set('music')){
         await play.play(AssetSource(path));
         await play.setReleaseMode(ReleaseMode.loop);

      }

   }

   void Stop()async{
      await play.pause();


   }




   }



