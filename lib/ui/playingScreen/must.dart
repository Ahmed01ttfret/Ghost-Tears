

import '../../variables.dart';
import 'but.dart';

List Playing_list=[];
bool finish(List l,String text){
  return l.contains(text);
}

bool probability(int num){
  if(num<=3){
    List x=[1,2,3,4,5,7];
    x.shuffle();
    int c=x[0];
    return c.isEven?true:false;
  }else if(num>4&&num<=8){
    List x=[1,7,3,4,5,11,55];
    x.shuffle();
    int c=x[0];
    return c.isEven?true:false;
  }else{
    List x=[1,2,3,5,7,9,11,13,15,17,81,99];
    x.shuffle();
    int c=x[0];
    return c.isEven?true:false;
  }
}


void reset_one(){
  List l=[];
  fun.value='';
  aku_.value=aku_.value+1;
  for(String x in list){
    l.add(x.substring(0,1));
  }
  l.shuffle();
  fun.value=l[0];
  info.value="It's your turn";
  List t=[];
  List y=[];
  for(String x in list){
    if(fun.value==x.substring(0,1)){
      t.add(x);
    }
  }
  for(String x in t){
    y.add(x.substring(1,2));
  }
  letter.value=y;

}



void reset_two(){
  List l=[];
  fun.value='';
  you_.value=you_.value+1;
  for(String x in list){
    l.add(x.substring(0,1));
  }
  l.shuffle();
  letter.value=l;
  info.value="It's your turn";
}





