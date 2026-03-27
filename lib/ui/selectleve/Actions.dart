import 'package:flutter/material.dart';
import 'package:ghost_game_tears/logics/database.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave_transition/wave_transition.dart';
import 'package:just_audio/just_audio.dart';
import '../../variables.dart';
import '../playingScreen/PlayHome.dart';
import '../txt.dart';

class TopActions extends StatefulWidget {
  const TopActions({Key? key}) : super(key: key);

  @override
  _TopActionsState createState() => _TopActionsState();
}

class _TopActionsState extends State<TopActions> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
            onPressed: ()async{

              Navigator.pop(context);
            },
            child: custom('↫')),
        Padding(
          padding: const EdgeInsets.fromLTRB(50, 7.5, 0, 0),
          child: Center(child: customs('Select Level')),
        )
      ],
    );
  }
}


class DropDownSelect extends StatefulWidget {
  const DropDownSelect({Key? key}) : super(key: key);

  @override
  _DropDownSelectState createState() => _DropDownSelectState();
}

class _DropDownSelectState extends State<DropDownSelect> {
  String _dropdownValue='Choose letters';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,

        child: DropdownButton(
          dropdownColor: Colors.red,

          items: const[
            DropdownMenuItem(child: Text('Countries'),value: 'Countries',),
            DropdownMenuItem(child: Text('fruits'), value: 'Fruits',),
            DropdownMenuItem(child: Text('european football teams'),value: 'European football teams',),
            DropdownMenuItem(child: Text('elements in the periodic table'), value: 'Elements in the periodic table',),
            DropdownMenuItem(child: Text('animals'), value: 'Animals',),

          ],

          onChanged: (l){
            setState(() {
              _dropdownValue=l.toString();
              list=play_list(l.toString());
            });
            },
          //value: _dropdownValue,
          hint: Text(_dropdownValue),
          style: GoogleFonts.mali(
            color: Colors.black,
            fontSize: 20


          ),
          iconEnabledColor: Colors.white,
          borderRadius: BorderRadius.circular(10),


        ),
      ),
    );
  }
}


class Levels extends StatefulWidget {
  const Levels({Key? key}) : super(key: key);

  @override
  _LevelsState createState() => _LevelsState();
}

class _LevelsState extends State<Levels> {
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


  Color color=Colors.black;
  void away(int num)async{
    if(list.isEmpty){
      //show toast
      showDialog(context: context, builder: (BuildContext contwxt){
        return AlertDialog(
          insetPadding: const EdgeInsets.fromLTRB(60, 120, 60, 120),

          backgroundColor: Colors.redAccent,

          title: Text('Select Words',
              style:GoogleFonts.mali()),
          content: Column(
            children: [Expanded(
              child: Text('Select The Group Of Words You Want To Use',
                style: GoogleFonts.mali(),

              ),
            ),
              TextButton(onPressed: (){
                showDialog(context: context, builder: (context)=>AlertDialog(
                  insetPadding: const EdgeInsets.fromLTRB(60, 120, 60, 120),

                  backgroundColor: Colors.deepOrange,
                  title: customs('Help'),
                  content: Center(
                    child: Text(
                        'This game is base on spellings of words but you did not select'
                            ' the group of words that will be used. '
                            'press on the dropdown to select your desired words ',
                        style:GoogleFonts.mali()),
                  ),
                  actions: [TextButton(onPressed: (){
                    Navigator.pop(context);
                  },
                      child: Text('Close',
                        style: GoogleFonts.permanentMarker(

                        ),))],
                ));
              }, child: customs('Help'))],
          ),
        );
      });
    }else{
      if(await Save().Get(num.toString())==true){
        Save().cut(num);
        if(await Save().set('song')){
          await player.setAsset('assets/images/success-1-6297.mp3');
          player.play();
        }
        lust=num;
        Navigator.push(
            context,
            WaveTransition(child: const PlayScreen(),
                center: const FractionalOffset(0.90,0.90),
                duration: const Duration(milliseconds: 3000)
            )
        );
      }
    }


  }

  Future<bool> condition(String text)async {
    var x = await Save().Get(text);
    return x;
  }


  Widget button(String text,int num){
    return FutureBuilder<bool>(
      future: condition(text),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.waiting:
            return const CircularProgressIndicator();
          default:
            if (snapshot.hasError){
              return const Text('');
            }else{
              return TextButton(
                onPressed: (){away(num);},
                child: level(text, snapshot.data!?Colors.black:Colors.black26),
              );
            }
        }

      },
    );
  }



  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 30, 15, 15),
      child: SizedBox(

        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                button('1', 1),


                button('2', 2),

                button('3', 3)

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                button('4', 4),
                button('5', 5),
                button('6', 6)

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                button('7', 7),
                button('8', 8),
                button('9', 9),

              ],

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                button('10', 10),
                button('11', 11),
                button('12', 12)

              ],
            ),
          ],
        ),
      ),
    );
  }
}
