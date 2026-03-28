import 'package:flutter/material.dart';
import 'package:ghost_game_tears/ui/txt.dart';

import 'bodycont.dart';


class HomeBodyCode extends StatefulWidget {
  const HomeBodyCode({Key? key}) : super(key: key);

  @override
  _HomeBodyCodeState createState() => _HomeBodyCodeState();
}

class _HomeBodyCodeState extends State<HomeBodyCode> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 20.0),
      child: Column(

        children: <Widget> [
          Center(child: custom_text('Ghost Tears')),
          ImageTap(),
        ],
      ),
    );
  }
}
