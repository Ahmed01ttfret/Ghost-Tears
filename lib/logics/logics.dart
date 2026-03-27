import 'dart:math';

import 'package:ghost_game_tears/variables.dart';


double convert(double x){
  return x/10;
}



List<String> Sample(List list,int num){
  int x=1;
  List<String> mylist=[];
  list.shuffle();
  while(x<=num){
    mylist.add(list[x]);
    x++;
  }
  return mylist;

}

List hard(List list){
  int len=list.length;
  if (len<=7){
    List old=Sample(alphabet,2);
    list.remove(list[0]);
    list.remove(list[1]);
    list=list+old;
    list.shuffle();
    return list;
  }else{
    int c=1;
    while(c<=4){
      list.remove(list[c]);
      c++;
    }
    list=list+Sample(alphabet, 4);
    list.shuffle();
    return list;


  }
}

String Wrong_letter(){
  int len=alphabet.length;
  var x=Random();
  int z=x.nextInt(len-1);
  return alphabet[z];
}