import 'package:flutter/cupertino.dart';
import 'package:ghost_game_tears/set/Data.dart';
import 'package:ghost_game_tears/variables.dart';






List spell(){
  List start=[];
  for(String x in list){
    start.add(x[0]);
  }
  return start;
}



ValueNotifier<String>fun=ValueNotifier(word);
ValueNotifier<List>letter=ValueNotifier(spell());
ValueNotifier<String>info=ValueNotifier('Start, its your turn');
ValueNotifier<double>progress=ValueNotifier(times);
ValueNotifier<int>aku_=ValueNotifier(0);
ValueNotifier<int>you_=ValueNotifier(0);
ValueNotifier<int>first_point=ValueNotifier(0);
ValueNotifier<int>second_point=ValueNotifier(0);